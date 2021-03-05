Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E332EE23
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 16:15:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93832.177241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICA9-0003mG-RQ; Fri, 05 Mar 2021 15:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93832.177241; Fri, 05 Mar 2021 15:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICA9-0003lq-Nd; Fri, 05 Mar 2021 15:14:45 +0000
Received: by outflank-mailman (input) for mailman id 93832;
 Fri, 05 Mar 2021 15:14:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w+o=ID=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lICA7-0003lX-AM
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 15:14:43 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be3c866e-eacc-47af-962c-951d1d130572;
 Fri, 05 Mar 2021 15:14:41 +0000 (UTC)
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
X-Inumbo-ID: be3c866e-eacc-47af-962c-951d1d130572
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614957281;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KE8xvHg8F3mCLeo0x3k1JDFaCnoCZky908qK8z6S1Nk=;
  b=JykXrHVq1DLfK1QGA6gqm9DxP/Mc0/vc/mPk8xhlwKaeAaOVf8avQzQU
   caJAU8xld2RszoU6oQWYpFr4kvy4VzoLLOxh+GIQnoxhar4JiEFxttbFr
   jpO8UgQ3vojhnXFSikN+auiWNOeIwf7F8cXmgZu6dv0Mha6p+gAz1JTbs
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0r+i9otqIxmqKs7lpg1fwv2ZyeO44K8Lla0Q17SAAEoWrCsIcNIrGPWOHJlhKymDuEssN6nyUL
 Q4UmAVv9ghcf0NfsADJknT7h7DVELUJs2MgjLOMgX2wPMUuLK/BSOLt9vRxO4aZlWo67aRjKn2
 L+D/mL3Re1r904HXgs9/usCRliu+jQ3r9XmNSvbbgUN8Oil9Ae6qHTXTYhj8MWqWEfpVAhO3xT
 YtYwp9ghy6jHRdkBbQyiEywHVcKelObKymfXi5VCACY9IoJTZAbOdygcvxfbohfzOBmy8rI5L5
 eFI=
X-SBRS: 5.2
X-MesageID: 38559275
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,225,1610427600"; 
   d="scan'208";a="38559275"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdDlREy+sVpmMlACqfUCsHjP58AHtQ4CklybXIohWl0MH2FJFMJhZwjXpTXirsVlcM61SsttxydKf+BISKhjowug27O/2sMIYwAgJUyU0LIxiL288e1D0PuZea+sL6Fc5Gi5cXH5qcZUVQ8tiD4Kf0XLt72jLjTUdTZiuVH5hhGtZa9+XoaMh0VZliBumTLfmSaukUfP/rvvKGtZ/jtdS4X5YStUrbQuImsZ3a/69AXZ4NnYre2KrCYPnqJfUVGU4XrYgdAuOjJGdFHmUlPl4YweVpd5btPNHQPauPYFqNjkGYf3MrXb0HYcy+WsA1tzU9gnpASBZtYKgrKgZ9K84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldD+TyTEd99yUtDPEHFx8m5z8iF8Yx1GfMg+4PNhkW8=;
 b=YudHY85hs0spFb0gyOnY6p1gtc8lf5e/cLjkcMwRAAU3a5QUYvxdsHfQBY+6qjIh29wF++AY2nn4qjnNxXeewy2WpQ/bHryzAmlwNai9AiQd9ZRh+G8zyK6WK87+2zquL5jOECsj3iB6ONXEhizizvby9RdelIEQgPhgfDo8IVmme2llFezn8JT0HySTpBY2NRE35gcLCiexAT4Bfa0NkpIShLp7T3dv7NaKg/Lze2McJZitichgTn/z0ZMRz0TiEw2QKUrrDIWaHmQtiWaIgnZtuOkL1IaCMbK/PfE+ldhjI3ef7SrR6ByQV1Z1pKH86BOxIz9HpCT5vvmFFf+nOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldD+TyTEd99yUtDPEHFx8m5z8iF8Yx1GfMg+4PNhkW8=;
 b=F+So8khTFSHFOEFLTeVCeIhTbNLx3MKD6+5WES+HDAU8YjYe/0l+y+NA5zy5K20th51MIOUhH+kECbjOJ/5P4wi58AEAN45fDpNIpPGJ4XoYk6xai2GSMaag/6Anvv9uO4Yne1hhKLTSy+tUIEcjj4KuwKi10L5WJf567S2CwjQ=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Ian Jackson <iwj@xenproject.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
 <20210305124949.6719-3-andrew.cooper3@citrix.com>
 <9b4acfc5-6d96-7922-7fde-5d0d543f8201@suse.com>
 <68a69e57-66b5-6f59-39f4-40649112fe40@citrix.com>
 <6b9fa11e-353e-8e10-8bec-f5c7930aae94@suse.com>
 <0e0fe64c-0834-a3e9-e85c-c17d8a510941@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] xen/dmop: Strip __XEN_TOOLS__ header guard from
 public API
Message-ID: <bdbe6c35-450a-479e-2675-259a6bbe218b@citrix.com>
Date: Fri, 5 Mar 2021 15:13:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <0e0fe64c-0834-a3e9-e85c-c17d8a510941@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0414.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40ab6872-bd80-4bd6-2c76-08d8dfe94d7d
X-MS-TrafficTypeDiagnostic: BY5PR03MB5284:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB528403570D3E5EA656A89040BA969@BY5PR03MB5284.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zbqxVwP5ddKUXVp4tHr7GyMvrUQv1smEcsnrqnqzZ4+MpkcXAquwi76tHuoo55Dz188H+IN2THoAMgzK//h4Vy5aAty3V9VVYsOu+cK60QL1RBzPapjIH2BdpLv30XWar36fe+HJRH2dCG5s1dGMl36JxoQHNzeBpSPbyfUJS2Vg4EFCBBqN3wNihxAkUe+nfP+lAcPx5sjwryEw42wzbne9lyA3PKS7vDXMRZ38UtLAfKjgIWkOS8/DlOPLSv48dnKZz2z1+K0Ffc4oRHoKKrEqpKg6iilVDs75plAlJYUD63i1/mdc8Dshff3BLvXsljbj9KjgVzET038KVuUSgxfo2Fi+IdrewoOp9HuZcg1zrcWy4/kOTnYwKtGD6eBKO7cgx/XxfV7KasbXOf3sfLdD/bYgOmvXPIP52StWcv0o+UiqsOj5OV5ehQfcY61fuY1RA1N1+OwBbypt79+MLXQf3fR0B2AVHprwo/Soig9qreSMbCG5nDxtZqDjBnVjlX9uCxzYgoUXuBV5ykWbAabS6+KFXni1OpaPXD8a+y1PWBjDkiWedcu5dNY1sAC75gYtjz8/Dox27Y35YOkNeZixysCefKU1b3o5OT5fyDM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(31696002)(4326008)(31686004)(2906002)(956004)(86362001)(26005)(6486002)(83380400001)(54906003)(6916009)(8936002)(2616005)(16526019)(66946007)(53546011)(16576012)(36756003)(8676002)(316002)(66476007)(5660300002)(186003)(6666004)(66556008)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aW9OY0R3U1FJV1dvSVQ2cXV2ek04a1RXZ096TkNkR044dUVrdXd1R3ZSWDZu?=
 =?utf-8?B?R3FWVTIyR3FpaUU4UTlHSWJTUXNZc2o3VjZ1aXBHbTZ1TTI3UnRQc2lPVFF1?=
 =?utf-8?B?dnZBQlY0UU5KRDBOYk1iVytmQ2o5RmFXWUh3VGZXWEY0SXBaQWlKalljcWNZ?=
 =?utf-8?B?ZnZvcDBvV3VLMUpDSU9PaUsvc085WHR1U1pXdXpmaEMwWDR6dmJwWmFweEo5?=
 =?utf-8?B?UWQ5T0szZFZ4cjRlZFpYbmRUTWZUWWgzeXplWTBOay9qZkpqS1dkcFc0cjVV?=
 =?utf-8?B?TStqOFAvNUNNNWtLK2svODZiWjVjeHMyVWlWRzBmQUt1WHVFOUhibjNkejMx?=
 =?utf-8?B?MTVlRmZLTmdyQUswZ2FxWWpWMDhYVDA0czUyaTJUSUNaQUtOQjlNU08wd1RC?=
 =?utf-8?B?cXV5U0U4bGEwOXVRT2Z2eHNOODdkSnoxcWhEL1RMU0cyUVd1VWl0ZGRiQ2lp?=
 =?utf-8?B?VGRQZ2M0RWVJcGJyZkpYVkg2NU5memVidmFTYlJld05tN0dVMkg2a1dNeXZ4?=
 =?utf-8?B?bFh3UGlnVmtTWlBuRWduOW5jTXRCaWdQd0Jza3gxbGJVT2dBeFlPTDlpTHFt?=
 =?utf-8?B?Z1FST0VyelBWQkdTak9wQjE3YlcwTWs1WHpDcjBxbTBJNEFIZHVIbHhjVTNX?=
 =?utf-8?B?VHdEZHFNaVpiVGc4cnowZUxVdnV6VnI5NzV5MUh5Kytxc3BwNDIwQ3psTE8v?=
 =?utf-8?B?NG1wYVBRRUp1ckw4YTZjRENqbEFjNThaK0pjMncyNVh6Z0pTU2lvNFoxUUNj?=
 =?utf-8?B?VVlNdTI4QXZLSWVxdjRZQkNDVmp1NGN1UEYrOEtQNTlTNFIwdTVJM0JoWHRD?=
 =?utf-8?B?NVpJQ0xsR3VTUXQrbkkrV1Q0SEQ1YnhoaW1nVExrYm1xek9jUERiaDBGaTQ1?=
 =?utf-8?B?Y0xQS0NhUENrWUlHdUpiS0VzaEZTU1NmdFA5R2dXbkIrbVdlOVdFYzdSVTQ1?=
 =?utf-8?B?SXlEK3IyNFBzYkdKeDhmVWo4dVlnNHN6RzhaR092Y2RGYmJvdXd0STE1bmNu?=
 =?utf-8?B?cXk1QWFzUmFVWkpCNTh3aW5wTUY0anhqK3FHd20yam0ydWIvMVNwL1hzVUd4?=
 =?utf-8?B?WHlaSzBCWHVtUTc2OXVQSW1KUlNqWlluR2drZU5lRzJwV3dPWVZEMXlabHF6?=
 =?utf-8?B?QWxPZXREcHo0dU9vRGpGZXlqYVhNY3Zuc0FPNk9BOEtNcTRocWE4ZUdPV21W?=
 =?utf-8?B?UE1xcGt4R0tha2dxQ2tJNkJ0a0gxKzdwUlZVUVlyc0lzSlY2TWVlMTVpS2dY?=
 =?utf-8?B?Z3gyWVY1Mk1Xc0xicTB1MHBRZkVpaDRzbmJMMytwaEl1TXVNbmM3SzZtWG9J?=
 =?utf-8?B?b3JKVXVsbkJHWmY2bUhIR3pPaEovVDhoeVJ0R3g0REhBMitxS054Q3BvOGha?=
 =?utf-8?B?KzhSUVZ5SWVDWUc2NDBCVVYrbldzYWl2OGlVV3k0VDRWeGNtLzlTQjBOL09E?=
 =?utf-8?B?Skk0TlMzTWoyaHlDM3ltd2JjQWF1cytxOGhrRWIvL1NEbGYvWlB5RStZU2Zp?=
 =?utf-8?B?bUVZZUJBVFpvc1BwMGltdm1HM2JBeEV6dGlEMEpVRVNGc1h2QlRoVkgySXI0?=
 =?utf-8?B?QlBhWFdhYzVURi9KK1JKK1E4UUV1amJsWmYvR3dsRUUybFFOTUQ5UlBjemxK?=
 =?utf-8?B?UEZHVVpZU0lLZ3RMZnkvNEc1RklVYXpLSzROODhxOXJ3bkNhR0l6Ny9TRmNZ?=
 =?utf-8?B?Qk1iL0VWdFd2ZXUwM2pIV1Vzak9uSzJ4cnhaM2RlSmxNVGFBU2xCVUVoZGpz?=
 =?utf-8?Q?YSPmM1d3vwwaDM1PW39QoWXWSBLvS9fTegNbYmY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ab6872-bd80-4bd6-2c76-08d8dfe94d7d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 15:13:59.5616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99pBXGrxolvhvJFbF82S2X2MzepMLDwbMvkU45r1wp2YD341puKFeXYpemNa98tYeq3hLzavuLXWfe1Xg4XtZYyWWR7q8nVzASdbLgnNbZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5284
X-OriginatorOrg: citrix.com

On 05/03/2021 14:21, Jan Beulich wrote:
> On 05.03.2021 15:18, Jan Beulich wrote:
>> On 05.03.2021 15:12, Andrew Cooper wrote:
>>> On 05/03/2021 13:53, Jan Beulich wrote:
>>>> On 05.03.2021 13:49, Andrew Cooper wrote:
>>>>> Exactly as with c/s f40e1c52e4, this is inappropriate for a stable li=
brary.
>>>>>
>>>>> That change actually broke the build with:
>>>>>
>>>>>   include/xendevicemodel.h:52:5: error: unknown type name 'ioservid_t=
'
>>>>>        ioservid_t *id);
>>>>>        ^
>>>>>
>>>>> as libxendevicemodel.h now uses a type it can't see a typedef for.  H=
owever,
>>>>> nothing noticed because the header.chk logic is also broken (fixed
>>>>> subsequently).
>>>> While I agree up to here, ...
>>>>
>>>>> Strip the guard from the public header, and remove compensation from
>>>>> devicemodel's private.h
>>>> ... I'm unconvinced that entirely dropping the guard from the
>>>> public header is wanted (or needed): We use these to make clear
>>>> that in particular kernels aren't supposed to make use of the
>>>> enclosed entities. If a type needs exposing, it (and only it)
>>>> wants moving ou of the guarded region imo.
>>> DMOP was invented specifically so a kernel module (i915, for Intel
>>> gVT-g) was independent of the domctl ABI version.
>>>
>>> Improving the life of dom0 userspace was an intended consequence, but
>>> not the driving force behind the change.
>> This is news to me - so far it had been my understanding that it
>> was introduced to have a way for the kernel to audit and hand on
>> requests to the hypervisor without needing to know all the inner
>> details. I wasn't even aware a kernel module was using any of
>> these.
> And indeed, quote from docs/designs/dmop.markdown:
>
> "The aim of DMOP is to prevent a compromised device model from
>  compromising domains other than the one it is providing emulation
>  for (which is therefore likely already compromised)."
>
> And it goes on discussing only the purpose that I've been aware
> of.

The use in the dom0 kernel wasn't kept secret in the slightest.=C2=A0 It wa=
s
discussed on at the time, and at dev summits.

But upstream tends to only remember/care about the bits which pertain
directly to upstream, and the design particulars of the DMOP ABI were
specifically for userspace.

~Andrew


