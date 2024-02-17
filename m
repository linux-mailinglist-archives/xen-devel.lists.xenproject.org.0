Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E0B858E48
	for <lists+xen-devel@lfdr.de>; Sat, 17 Feb 2024 10:12:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682408.1061546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbGjT-0002hj-F8; Sat, 17 Feb 2024 09:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682408.1061546; Sat, 17 Feb 2024 09:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbGjT-0002gA-C6; Sat, 17 Feb 2024 09:11:39 +0000
Received: by outflank-mailman (input) for mailman id 682408;
 Sat, 17 Feb 2024 09:11:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ITqj=J2=tls.msk.ru=mjt@srs-se1.protection.inumbo.net>)
 id 1rbGjS-0002g4-00
 for xen-devel@lists.xenproject.org; Sat, 17 Feb 2024 09:11:38 +0000
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c969d43-cd74-11ee-8a52-1f161083a0e0;
 Sat, 17 Feb 2024 10:11:37 +0100 (CET)
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 79B124E172;
 Sat, 17 Feb 2024 12:11:47 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 5401281CA3;
 Sat, 17 Feb 2024 12:11:34 +0300 (MSK)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8c969d43-cd74-11ee-8a52-1f161083a0e0
Message-ID: <e7943a9b-7b2c-4c5c-8f41-f12cc3e75874@tls.msk.ru>
Date: Sat, 17 Feb 2024 12:11:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pt: fix igd passthrough for pc machine with xen
 accelerator
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-stable@nongnu.org
References: <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz.ref@aol.com>
 <a304213d26506b066021f803c39b87f6a262ed86.1675820085.git.brchuckz@aol.com>
 <986d9eca-5fab-cacb-05c7-b85e4d58665b@msgid.tls.msk.ru>
 <47ed3568-2127-a865-4e4f-ff5902484231@aol.com>
 <2b07603f-6623-9fbf-15df-a86849d9aca3@msgid.tls.msk.ru>
 <alpine.DEB.2.22.394.2305171246020.128889@ubuntu-linux-20-04-desktop>
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 xsBLBETIiwkBCADh3cFB56BQYPjtMZCfK6PSLR8lw8EB20rsrPeJtd91IoNZlnCjSoxd9Th1
 bLUR8YlpRJ2rjc6O1Bc04VghqUOHgS/tYt8vLjcGWixzdhSLJgPDK3QQZPAvBjMbCt1B6euC
 WuD87Pv5Udlpnzf4aMwxkgfTusx+ynae/o+T5r7tXD+isccbC3SiGhmAPxFyY3zGcFk4+Rxc
 0tP8YY2FWE/baHu+lBDTUN79efWAkHhex1XzVZsV7ZD16rzDbXFK5m6ApvGJWlr5YDEEydTF
 WwmvwBfr4OINVxzEG/ujNiG4fpMf2NsnFGyB9aSbFjXZevB4qWkduYYW+xpK1EryszHtAAYp
 zSBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1PsLAlgQTAQoAQAIbAwYLCQgHAwIE
 FQIIAwQWAgMBAh4BAheAAhkBFiEEbuGV0Yhuj/uBDUMkRXzgoIBEZcUFAmBbcjwFCS5e6jMA
 CgkQRXzgoIBEZcUTIQgA1hPsOF82pXxbcJXBMc4zB9OQu4AlnZvERoGyw7I2222QzaN3RFuj
 Fia//mapXzpIQNF08l/AA6cx+CKPeGnXwyZfF9fLa4RfifmdNKME8C00XlqnoJDZBGzq8yMy
 LAKDxl9OQWFcDwDxV+irg5U3fbtNVhvV0kLbS2TyQ0aU5w60ERS2NcyDWplOo7AOzZWChcA4
 UFf78oVdZdCW8YDtU0uQFhA9moNnrePy1HSFqduxnlFHEI+fDj/TiOm2ci48b8SBBJOIJFjl
 SBgH8+SfT9ZqkzhN9vh3YJ49831NwASVm0x1rDHcIwWD32VFZViZ3NjehogRNH9br0PSUYOC
 3s7ATQRX2BjLAQgAnak3m0imYOkv2tO/olULFa686tlwuvl5kL0NWCdGQeXv2uMxy36szcrh
 K1uYhpiQv4r2qNd8BJtYlnYIK16N8GBdkplaDIHcBMbU4t+6bQzEIJIaWoq1hzakmHHngE2a
 pNMnUf/01GFvCRPlv3imkujE/5ILbagjtdyJaHF0wGOSlTnNT4W8j+zPJ/XK0I5EVQwtbmoc
 GY62LKxxz2pID6sPZV4zQVY4JdUQaFvOz1emnBxakkt0cq3Qnnqso1tjiy7vyH9CAwPR/48W
 fpK6dew4Fk+STYtBeixOTfSUS8qRS/wfpUeNa5RnEdTtFQ9IcjpQ/nPrvJJsu9FqwlpjMwAR
 AQABwsBlBBgBCAAPBQJX2BjLAhsMBQkSzAMAAAoJEEV84KCARGXFUKcH/jqKETECkbyPktdP
 cWVqw2ZIsmGxMkIdnZTbPwhORseGXMHadQODayhU9GWfCDdSPkWDWzMamD+qStfl9MhlVT60
 HTbo6wu1W/ogUS70qQPTY9IfsvAj6f8TlSlK0eLMa3s2UxL2oe5FkNs2CnVeRlr4Yqvp/ZQV
 6LXtew4GPRrmplUT/Cre9QIUqR4pxYCQaMoOXQQw3Y0csBwoDYUQujn3slbDJRIweHoppBzT
 rM6ZG5ldWQN3n3d71pVuv80guylX8+TSB8Mvkqwb5I36/NAFKl0CbGbTuQli7SmNiTAKilXc
 Y5Uh9PIrmixt0JrmGVRzke6+11mTjVlio/J5dCM=
In-Reply-To: <alpine.DEB.2.22.394.2305171246020.128889@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

17.05.2023 22:48, Stefano Stabellini :
> On Wed, 17 May 2023, Michael Tokarev wrote:
>> 17.05.2023 12:47, Chuck Zmudzinski wrote:
>>> On 5/17/2023 2:39 AM, Michael Tokarev wrote:
>>>> 08.02.2023 05:03, Chuck Zmudzinski wrote:...
>>>>> Fixes: 998250e97661 ("xen, gfx passthrough: register host bridge
>>>>> specific to passthrough")
>>>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>>>>
>>>> Has this change been forgotten?  Is it not needed anymore?
...
>> It just neeeds to be picked up the usual way as all other qemu changes goes in.

> I am OK with this patch and acked it. However, I think it also needs an
> ack from one if the i386 maintainers, Michal T or Marcel.

Ping again?  It's been quite a while...
@mst, @marcel?

(Just looking at the stable-todo stuff)

/mjt


