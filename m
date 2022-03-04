Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197B4CCF7F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 09:03:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283992.483139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2uO-00079k-Ti; Fri, 04 Mar 2022 08:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283992.483139; Fri, 04 Mar 2022 08:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2uO-00077h-Q2; Fri, 04 Mar 2022 08:03:28 +0000
Received: by outflank-mailman (input) for mailman id 283992;
 Fri, 04 Mar 2022 07:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evYc=TP=gmail.com=trigger.huang@srs-se1.protection.inumbo.net>)
 id 1nQ2ci-0003I0-E5
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 07:45:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0503ec92-9b8f-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 08:45:11 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id x15so11329551wru.13
 for <xen-devel@lists.xenproject.org>; Thu, 03 Mar 2022 23:45:11 -0800 (PST)
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
X-Inumbo-ID: 0503ec92-9b8f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=VYGOGoGLQH9F6CymjlPAmDax1Fii+CrifqjSgPcKrLs=;
        b=o7icDHbW4OOxUmKH4gZi1/q9xSJqgVNGc27ZarBZ3XJjK9xkdbRtDddyS73FonnhWQ
         qEyDkwoOGVeyDxCaI+4Gv4sEIsG5EI9GxhswsohZzfcM7sqz2cVIrJTDZQZLleoohxIJ
         VGK9vB099xKaMmrl0Vk/Tpyy5Kf5sdnbrZB6T1wa+hMTnYPCIvvqoO6MWXkOCk4kJWIi
         Degy99kas9cufP+K+QLHyIPTjZMYU2z5zunXIdYFFd8wuvsgvmJ+j1vVs6G/4Ibn34Jq
         hZjWQd0wXyaOy81xQlLWdU9TfUlx+0tjIsVMIYJh0SiXVxRItBL8Wijgoxp1CWiKenfs
         dFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=VYGOGoGLQH9F6CymjlPAmDax1Fii+CrifqjSgPcKrLs=;
        b=r03CikY/QuCjSyBxHVRouJtY0T+Fv4D3TR6aiIkyVK8BEXOEkOgk1JBw9Flvxu+IIz
         2SKZ2QLzNZH4upySJvTX4iAOwbgvO4YfWcHL3yl7ZgcflxbHoqaX9GrdocNmqR1d0Dba
         t1///kLlw2bvZySh+mCCEbJgeUT/WJpG6Iq2HL+Pb1GHrZ1J9MSNZgepmucWfKPtzlpg
         0iTQ9GS9OKH/1CSg18en1j0LEzgBvcWQgkAaegqGosGskl5DkDf9jqQYkx1jbf/nS8WC
         WJYgtoV0WeM8n1XyIcAytzb9z3UYktqUvpCo6L8KgHhbx0wXXXU3SoavuQb6ZKcaJkKT
         yXVQ==
X-Gm-Message-State: AOAM530FZuuWmOyMWweSEiYzfPPxBKHAhhyY9lSxzpVwg71SyKfZigu6
	qUhC8iJFlL3E1IHZ1kGl4Zuqr1fa3hQ1VnbVGoNAXMdSwzQ=
X-Google-Smtp-Source: ABdhPJxy2xNmZcj0AYSZJQQcBdc3gEtHQDPA23WqOMAsaWteErm6X9QQ4WiuzJx78rO2zgahRLdEpbTlM8rMmlqJ79o=
X-Received: by 2002:a5d:514e:0:b0:1f0:25a5:2d49 with SMTP id
 u14-20020a5d514e000000b001f025a52d49mr8865529wrt.154.1646379910442; Thu, 03
 Mar 2022 23:45:10 -0800 (PST)
MIME-Version: 1.0
From: Trigger Huang <trigger.huang@gmail.com>
Date: Fri, 4 Mar 2022 15:44:59 +0800
Message-ID: <CANH0Q9k6SJQ+EXNZz+-ZPnPtsxHXthYcx1E6z8euSDEt7XhLQg@mail.gmail.com>
Subject: How to create and start Xen guest VM by qemu-system-x86_64 command line
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000ba31c205d95fb164"

--000000000000ba31c205d95fb164
Content-Type: text/plain; charset="UTF-8"

Hello,

I have built & installed Xen 4.15 onto my Ubuntu20.04 platform successfully
according to https://wiki.xenproject.org/wiki/Compiling_Xen_From_Source
After reboot, I entered Domain 0 successfully. The command xl info shows
the right version string.


































*host                   : xvgrelease                :
5.13.0-30-genericversion                : #33~20.04.1-Ubuntu SMP Mon Feb 7
14:25:10 UTC 2022machine                : x86_64nr_cpus                :
16max_cpu_id             : 31nr_nodes               : 1cores_per_socket
  : 8threads_per_core       : 2cpu_mhz                : 2994.377hw_caps
           :
178bf3ff:76d8320b:2e500800:244037ff:0000000f:219c91a9:00400004:00000500virt_caps
             : pv hvm hvm_directio pv_directio hap shadowtotal_memory
    : 15719free_memory            : 11425sharing_freed_memory   :
0sharing_used_memory    : 0outstanding_claims     : 0free_cpus
 : 0xen_major              : 4xen_minor              : 15xen_extra
     : .3-pre-atg08xen_version            : 4.15.3-pre-atg08xen_caps
        : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p
hvm-3.0-x86_64xen_scheduler          : credit2xen_pagesize           :
4096platform_params        : virt_start=0xffff800000000000xen_changeset
     : Fri Mar 4 13:33:49 2022 +0800 git:6aa4cdbc31xen_commandline        :
placeholder dom0_mem=4096M,max:8192M no-real-mode edd=offcc_compiler
     : gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0cc_compile_by          :
xvgcc_compile_domain      :cc_compile_date        : Fri Mar  4 14:21:33 CST
2022build_id               :
234929adcb7588b1414c2b6e5477fa95052b4dedxend_config_format     : 4*

Then my next step is to create ubuntu guest VM(sudo or use root user):
   */usr/local/lib/xen/bin/qemu-system-x86_64 -smp 1 -xen-domid 4 -machine
xenfv -m 4G -net nic,model=virtio -net user,hostfwd=tcp::2222-:22 -hda
./u2004.qcow2 -boot d -cdrom ./ubuntu-20.04-desktop-amd64.iso*
However, I always failed with the following error:

*  qemu-system-x86_64: failed to map ioreq server resources: error 3
handle=0x55eeb1f6c0b0    qemu-system-x86_64: xen hardware virtual machine
initialisation failed*
After debugging, the error is caused by osdep_xenforeignmemory_map_resource
failed to invoke IOCTL_PRIVCMD_MMAP_RESOURCE. And this IOCTL will return
-1.

So my question is, am I using the right qemu command? Anything else is
needed to set/config?
Note, if I didn't specify the option ' *-xen-domid 4 -machine xenfv* ', I
can start qemu successfully

Would you please help with it?

--000000000000ba31c205d95fb164
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I have built &amp; in=
stalled Xen 4.15 onto my Ubuntu20.04 platform successfully according to <a =
href=3D"https://wiki.xenproject.org/wiki/Compiling_Xen_From_Source">https:/=
/wiki.xenproject.org/wiki/Compiling_Xen_From_Source</a> <br></div><div>Afte=
r reboot, I entered Domain 0 successfully. The command xl info shows the ri=
ght version string.</div><div><u><i>host =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : xvg<br>release =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0: 5.13.0-30-generic<br>version =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: #33~20.04.1-Ubuntu SMP Mon Feb 7 14=
:25:10 UTC 2022<br>machine =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0: x86_64<br>nr_cpus =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0: 16<br>max_cpu_id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 31<br=
>nr_nodes =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 1<br>cores_per=
_socket =C2=A0 =C2=A0 =C2=A0 : 8<br>threads_per_core =C2=A0 =C2=A0 =C2=A0 :=
 2<br>cpu_mhz =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 2994=
.377<br>hw_caps =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 17=
8bf3ff:76d8320b:2e500800:244037ff:0000000f:219c91a9:00400004:00000500<br>vi=
rt_caps =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: pv hvm hvm_direct=
io pv_directio hap shadow<br>total_memory =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 : 15719<br>free_memory =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: 11425=
<br>sharing_freed_memory =C2=A0 : 0<br>sharing_used_memory =C2=A0 =C2=A0: 0=
<br>outstanding_claims =C2=A0 =C2=A0 : 0<br>free_cpus =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0: 0<br>xen_major =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0: 4<br>xen_minor =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0: 15<br><b>xen_extra =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0: .3-pre-atg08<br>xen_version =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=
 4.15.3-pre-atg08</b><br>xen_caps =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64<br>x=
en_scheduler =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: credit2<br>xen_pagesize =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 4096<br>platform_params =C2=A0 =C2=A0 =
=C2=A0 =C2=A0: virt_start=3D0xffff800000000000<br>xen_changeset =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0: Fri Mar 4 13:33:49 2022 +0800 git:6aa4cdbc31<br>x=
en_commandline =C2=A0 =C2=A0 =C2=A0 =C2=A0: placeholder dom0_mem=3D4096M,ma=
x:8192M no-real-mode edd=3Doff<br>cc_compiler =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0: gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0<br>cc_compile_by =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: xvg<br>cc_compile_domain =C2=A0 =C2=A0 =
=C2=A0:<br>cc_compile_date =C2=A0 =C2=A0 =C2=A0 =C2=A0: Fri Mar =C2=A04 14:=
21:33 CST 2022<br>build_id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 : 234929adcb7588b1414c2b6e5477fa95052b4ded<br>xend_config_format =C2=A0 =
=C2=A0 : 4</i><br></u></div><div><br></div><div>Then my next step is to cre=
ate ubuntu guest VM(sudo or use root user):</div><div>=C2=A0=C2=A0 <u><i>/u=
sr/local/lib/xen/bin/qemu-system-x86_64 -smp 1 <b>-xen-domid 4</b> -machine=
 xenfv -m 4G -net nic,model=3Dvirtio -net user,hostfwd=3Dtcp::2222-:22 -hda=
 ./u2004.qcow2 -boot d -cdrom ./ubuntu-20.04-desktop-amd64.iso</i></u></div=
><div>However, I always failed with the following error:</div><div>=C2=A0=
=C2=A0<u><i>=C2=A0 qemu-system-x86_64: failed to map ioreq server resources=
: error 3 handle=3D0x55eeb1f6c0b0<br>=C2=A0=C2=A0=C2=A0 qemu-system-x86_64:=
 xen hardware virtual machine initialisation failed</i></u><br></div><div>A=
fter debugging, the error is caused by osdep_xenforeignmemory_map_resource =
failed to invoke IOCTL_PRIVCMD_MMAP_RESOURCE. And this IOCTL will return -1=
.=C2=A0 <br></div><div><br></div><div>So my question is, am I using the rig=
ht qemu command? Anything else is needed to set/config?</div><div>Note, if =
I didn&#39;t specify the option &#39;
<u><i><b>-xen-domid 4</b> -machine xenfv</i></u>

&#39;, I can start qemu successfully<br></div><div><br></div><div>Would you=
 please help with it?<br></div><div><br></div></div>

--000000000000ba31c205d95fb164--

