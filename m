Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6078A0A83
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 09:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703791.1099677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rupB3-0003o8-IO; Thu, 11 Apr 2024 07:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703791.1099677; Thu, 11 Apr 2024 07:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rupB3-0003kx-Eo; Thu, 11 Apr 2024 07:48:57 +0000
Received: by outflank-mailman (input) for mailman id 703791;
 Thu, 11 Apr 2024 07:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8Vl=LQ=bounce.vates.tech=bounce-md_30504962.661795e3.v1-421806e59dad4091ac07bacef9305c56@srs-se1.protection.inumbo.net>)
 id 1rupB1-0003kr-Kd
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 07:48:55 +0000
Received: from mail177-6.suw61.mandrillapp.com
 (mail177-6.suw61.mandrillapp.com [198.2.177.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0d498ce-f7d7-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 09:48:53 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-6.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4VFWzR6YK1z2K1rf7
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 07:48:51 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 421806e59dad4091ac07bacef9305c56; Thu, 11 Apr 2024 07:48:51 +0000
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
X-Inumbo-ID: f0d498ce-f7d7-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1712821731; x=1713082231;
	bh=dGrIy8avszgj6K1Y8ll0VWeRa34JdWQcIosoWvYASkA=;
	h=From:Subject:In-Reply-To:References:Message-Id:To:Cc:Feedback-ID:
	 Date:MIME-Version:Content-Type:CC:Date:Subject:From;
	b=BYZDb0GAWdK4T+1GceJF4ww4ebe2evWA9j0M74myIapDjnBPgNzpVftR9EJ+t34eG
	 ORRgkhj8MZKJp4FRmA79kazWDqumzxdpbfnzCPTv4PQjAz+jOZQX0PbvvO8JviKCdW
	 RF7IC/jQenHAwMhf5aaa46TWbgEF2qJQMHJrZZcKiK9SM0z2pQoBxaLX4WnF1vVbCn
	 CMBdsDArroucEe9UyEAANSsKpOUuQlpvgVLPBveCjgGfGURKGqrJLgdVEHrEd9S7j6
	 VRZKvd8XsHOGhbXSg62082vk2ArNACDmF9MHOhAdfR2wzWNqVLh7rPK3jFLgzZ7V7a
	 EFZN8sxLzXbqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1712821731; x=1713082231; i=andrei.semenov@vates.tech;
	bh=dGrIy8avszgj6K1Y8ll0VWeRa34JdWQcIosoWvYASkA=;
	h=From:Subject:In-Reply-To:References:Message-Id:To:Cc:Feedback-ID:
	 Date:MIME-Version:Content-Type:CC:Date:Subject:From;
	b=YzRVJjrYZZEhL/xdqJghAeIqYdwtvNzAQaS+XlFrlarbmvGU59YLRokgASutdBh2n
	 C0Q6PXeQKDO3k8a7xcT/PtFZSgo4OV2dOwoHHmSUYXIo1fAUAXBqsmYAKMgNwDVMAU
	 eT4adv6RxRki7jU4bQUeh3CayYosDWpP3FdAcvXAdNqYypgjUS2gabqj6LMqxabQ+H
	 8apF5Wf+2rwdKk0I0jOnlRk9Y6UBLN3RHJXJnhs1wmbSOj1o2rtPzzHwquYy7PZiIb
	 ZgaPHqqgt4OC+Vxq8LhrdRc/ClXrT72n9yNJJGK+Sg83fTj4VG4ml6KAYQls0wpV1z
	 0goXbZUoDQoow==
From: Andrei Semenov <andrei.semenov@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=200/2]=20Starting=20AMD=20SEV=20work?=
X-Bm-Draft-Info: {"type":"REPLY-ALL","messageInternalId":2367385,"folderUid":"5bc3cd3c-1c54-4448-8b93-1d5e00399c41"}
X-Bm-Draft-Identity: default
X-Bm-Sent-Folder: e241ae38-d68a-470c-b463-de37822a6206
X-Bm-Draft-Refresh-Date: 1712821713054
X-Bm-Internal-Id: AF93AA0B-DAD8-4612-B2C2-10A4B7388341 bluemind-4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2 2367893
X-Bm-Previous-Body: 501ae02fae91c64faa0e31183ea6e96eb951f431
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1712821715123
In-Reply-To: <Zhcz2d4JsAl4J6vG@mail-itl>
References: <cover.1712759753.git.andrei.semenov@vates.fr> <Zhcz2d4JsAl4J6vG@mail-itl>
Message-Id: <luuxtj4p.1c2sh0vy8yf40@vates.tech>
To: =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Andrei Semenov <andrei.semenov@vates.fr>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.421806e59dad4091ac07bacef9305c56?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240411:md
Date: Thu, 11 Apr 2024 07:48:51 +0000
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_av-ZsQGSnJ_JO4Y2Io0z9KJfA"

--_av-ZsQGSnJ_JO4Y2Io0z9KJfA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yes, actually a PSP device and all its interfaces come as unique PCI device=
 (one BDF). So, yes we will need to export
other interfaces as a paravirtualized operations for dom0. Actual PSP desig=
n feet very well for KVM, but for "type 1"
hypervisors it oblige to export all other potential PSP interfaces for priv=
eleged guests.
Best regards,
Andrei Semenov
Le jeudi 11/04/2024 02:50, Marek Marczykowski-G=C3=B3recki <marmarek@invisi=
blethingslab.com> a =C3=A9crit :

On Wed, Apr 10, 2024 at 05:36:34PM +0200, Andrei Semenov wrote:

 This patch series initiate work on AMD SEV technology implementation in Xe=
n.
 SEV stands for "Secure Encrypted Virtualization" and allows the memory con=
tents
 of a VM to be encrypted with a key unique to this VM. In this way the neit=
her
 other VMs nor hypervisor can't read the memory content of this "encrypted"
 VM.
 
 In order to create and to run such a VM different layers of software must
 interact (bascally Xen hypevisor, Xen toolstack in dom0 and the encrypted =
VM
 itself).
 
 In this work we start with discovering and enabling SEV feature on the pla=
tform.
 The second patch ports AMD Secure Processor driver on Xen. This AMD Secure
 Processor device (a.k.a PSP) is the way the different software layers inte=
ract
 with AMD firmware/hardware to manage and run the encrypted VM.


How will that interact with the PSP driver in dom0? AFAIK amdgpu driver
uses PSP for loading the GPU firmware. Does it mean one need to choose
either GPU in dom0 or encrypted VMs, or is it going to work somehow
together?

-- 
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab



--_av-ZsQGSnJ_JO4Y2Io0z9KJfA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"bm-composer-content-wrapper"><div style=3D"font-family: Montserr=
at, montserrat, &quot;Source Sans&quot;, &quot;Helvetica Neue&quot;, Helvet=
ica, Arial, sans-serif;"><span style=3D"max-width:100%;font-size:14px;text-=
align:start">Yes, actually a PSP device and all its interfaces come as uniq=
ue PCI device (one BDF). So, yes we will need to export&nbsp;</span><div st=
yle=3D"max-width:100%;font-size:14px;text-align:start">other interfaces&nbs=
p;&nbsp;<span style=3D"max-width:100%;font-size:0.8125rem">as a paravirtual=
ized operations for dom0. Actual PSP design feet very well for KVM, but for=
 "type 1"&nbsp;</span></div><div style=3D"max-width:100%;font-size:14px;tex=
t-align:start"><span style=3D"max-width:100%;font-size:0.8125rem">hyperviso=
rs it oblige&nbsp;</span><span style=3D"max-width:100%;font-size:0.8125rem"=
>to export all&nbsp;</span><span style=3D"max-width:100%;font-size:0.8125re=
m">other potential PSP interfaces for priveleged guests.</span></div><div s=
tyle=3D"max-width:100%;font-size:14px;text-align:start"><br style=3D"max-wi=
dth:100%"></div><div style=3D"max-width:100%;font-size:14px;text-align:star=
t">Best regards,</div><span style=3D"max-width:100%;font-size:14px;text-ali=
gn:start">Andrei Semenov</span><br></div><br><div id=3D"data-bm-forward-sep=
arator"><p>Le jeudi 11/04/2024 02:50, Marek Marczykowski-G=C3=B3recki &lt;m=
armarek@invisiblethingslab.com&gt; a =C3=A9crit :</p><blockquote style=3D"m=
argin-left: 1rem; padding-left: 1rem; border-left: 2px solid black;"><div i=
d=3D"bm-composer-content-wrapper"><pre>On Wed, Apr 10, 2024 at 05:36:34PM +=
0200, Andrei Semenov wrote:
<blockquote class=3D"reply"> This patch series initiate work on AMD SEV tec=
hnology implementation in Xen.
 SEV stands for "Secure Encrypted Virtualization" and allows the memory con=
tents
 of a VM to be encrypted with a key unique to this VM. In this way the neit=
her
 other VMs nor hypervisor can't read the memory content of this "encrypted"
 VM.
 
 In order to create and to run such a VM different layers of software must
 interact (bascally Xen hypevisor, Xen toolstack in dom0 and the encrypted =
VM
 itself).
 
 In this work we start with discovering and enabling SEV feature on the pla=
tform.
 The second patch ports AMD Secure Processor driver on Xen. This AMD Secure
 Processor device (a.k.a PSP) is the way the different software layers inte=
ract
 with AMD firmware/hardware to manage and run the encrypted VM.
</blockquote>
How will that interact with the PSP driver in dom0? AFAIK amdgpu driver
uses PSP for loading the GPU firmware. Does it mean one need to choose
either GPU in dom0 or encrypted VMs, or is it going to work somehow
together?

-- 
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
</pre></div></blockquote></div><style></style></div>
<img src=3D"http://bounce.vates.tech/track/open.php?u=3D30504962&id=3D42180=
6e59dad4091ac07bacef9305c56" height=3D"1" width=3D"1" alt=3D"">

--_av-ZsQGSnJ_JO4Y2Io0z9KJfA--


