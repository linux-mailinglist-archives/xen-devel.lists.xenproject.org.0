Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C0681427
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 16:10:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487059.754539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMVng-0000dC-UU; Mon, 30 Jan 2023 15:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487059.754539; Mon, 30 Jan 2023 15:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMVng-0000bU-Rl; Mon, 30 Jan 2023 15:10:28 +0000
Received: by outflank-mailman (input) for mailman id 487059;
 Mon, 30 Jan 2023 15:10:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SNTu=53=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1pMVnf-0000bM-3N
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 15:10:27 +0000
Received: from ppsw-33.srv.uis.cam.ac.uk (ppsw-33.srv.uis.cam.ac.uk
 [131.111.8.133]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3955c2e4-a0b0-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 16:10:26 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47388)
 by ppsw-33.srv.uis.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1pMVnY-0009bd-SO (Exim 4.96) (return-path <amc96@srcf.net>);
 Mon, 30 Jan 2023 15:10:20 +0000
Received: from [10.80.2.8] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 88A0C1FBD6;
 Mon, 30 Jan 2023 15:10:20 +0000 (GMT)
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
X-Inumbo-ID: 3955c2e4-a0b0-11ed-9ec0-891035b88211
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <4b454af5-925c-c95b-42a1-4e125265e3f4@srcf.net>
Date: Mon, 30 Jan 2023 15:10:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH v4 3/3] build: compat-xlat-header.py: optimisation to
 search for just '{' instead of [{}]
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230119152256.15832-1-anthony.perard@citrix.com>
 <20230119152256.15832-4-anthony.perard@citrix.com>
 <60df7795-8f0b-e0f2-a790-2e00c0d4db2a@citrix.com>
 <Y85hxvyTHa/nXZ9H@perard.uk.xensource.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <Y85hxvyTHa/nXZ9H@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/01/2023 10:30 am, Anthony PERARD wrote:
> On Fri, Jan 20, 2023 at 06:26:14PM +0000, Andrew Cooper wrote:
>> On 19/01/2023 3:22 pm, Anthony PERARD wrote:
>>> `fields` and `extrafields` always all the parts of a sub-struct, so
>>> when there is '}', there is always a '{' before it. Also, both are
>>> lists.
>>>
>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>> ---
>>>  xen/tools/compat-xlat-header.py | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/tools/compat-xlat-header.py b/xen/tools/compat-xlat-header.py
>>> index ae5c9f11c9..d0a864b68e 100644
>>> --- a/xen/tools/compat-xlat-header.py
>>> +++ b/xen/tools/compat-xlat-header.py
>>> @@ -105,7 +105,7 @@ def handle_field(prefix, name, id, type, fields):
>>>          else:
>>>              k = id.replace('.', '_')
>>>              print("%sXLAT_%s_HNDL_%s(_d_, _s_);" % (prefix, name, k), end='')
>>> -    elif not re_brackets.search(' '.join(fields)):
>>> +    elif not '{' in fields:
>>>          tag = ' '.join(fields)
>>>          tag = re.sub(r'\s*(struct|union)\s+(compat_)?(\w+)\s.*', '\\3', tag)
>>>          print(" \\")
>>> @@ -290,7 +290,7 @@ def build_body(name, tokens):
>>>      print(" \\\n} while (0)")
>>>  
>>>  def check_field(kind, name, field, extrafields):
>>> -    if not re_brackets.search(' '.join(extrafields)):
>>> +    if not '{' in extrafields:
>>>          print("; \\")
>>>          if len(extrafields) != 0:
>>>              for token in extrafields:
>> These are the only two users of re_brackets aren't they?  In which case
>> you should drop the re.compile() too.
> Indeed, I miss that, we can drop re_brackets.

I've folded this deletion and queued the series for when OSSTest gets
unblocked.

~Andrew

