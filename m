Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088986C6E13
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 17:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513984.795822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfO5P-00011S-TE; Thu, 23 Mar 2023 16:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513984.795822; Thu, 23 Mar 2023 16:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfO5P-0000xt-Pl; Thu, 23 Mar 2023 16:46:47 +0000
Received: by outflank-mailman (input) for mailman id 513984;
 Thu, 23 Mar 2023 16:46:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbzt=7P=bounce.vates.fr=bounce-md_30504962.641c8271.v1-201dde821a22463199c8a2f98b00116a@srs-se1.protection.inumbo.net>)
 id 1pfO5N-0000xc-0k
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 16:46:45 +0000
Received: from mail187-21.suw11.mandrillapp.com
 (mail187-21.suw11.mandrillapp.com [198.2.187.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a4b9805-c99a-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 17:46:43 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-21.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4PjB7k14QMz1XLPTd
 for <xen-devel@lists.xenproject.org>; Thu, 23 Mar 2023 16:46:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 201dde821a22463199c8a2f98b00116a; Thu, 23 Mar 2023 16:46:41 +0000
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
X-Inumbo-ID: 4a4b9805-c99a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1679590002; x=1679647602; i=yann.dirson@vates.fr;
	bh=PxyzX5VAaTIVXR7+fzTYIMelE7CZp9+UUVw/teWKcyc=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:CC:Date:Subject:From;
	b=NEEu7rxHVdaPYz8THsI6LzfyiTm5L7yBEny4/o8mvXTZl/xsEhXr0T07fw57J6VrR
	 cRLDIkxWQVuW/HJCAS2FtFjL2aZN+HnaGMgBQzHpHqLe9KkzMXg/Q8r/eot9DkvX7i
	 thtQ9J0DT2oow1FaOdEHFW3yeVn7yTRp/PLWT0QM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1679590001; h=From : 
 Subject : Message-Id : To : Date : MIME-Version : Content-Type : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=PxyzX5VAaTIVXR7+fzTYIMelE7CZp9+UUVw/teWKcyc=; 
 b=UAuMGG/HdDxjt3atyANF25dxW8y6/xzxU11hLZ1i1bD09Klxf1tOHIpRwzOQIfn0Vu7sV+
 tmqzx1odoKW5G0Lt3YrB8VZ3HL+Vb4ROzMRJXUOtTK5bhjERTp3z4B/QHItxmRj7FsjWNw9Y
 6IBQT233nawgmWYLWHka6UgHNvH1U=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: [RFC] Rust Xen guest-agent
X-Bm-Draft-Refresh-Date: 1679589998731
X-Bm-Internal-Id: 88BE90AF-0050-4D65-B106-62AA3F1CA5E6#bluemind-4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2:1197638
X-Bm-Previous-Body: cde03d2117817885eee9212ad11433b4e24b238e
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4eb783c3-df1d-477e-89ee-a8b2cef54fd9
X-Bm-Transport-Timestamp: 1679590000504
Message-Id: <lflch8vf.2crenkmkzruv4@vates.fr>
To: xen-devel@lists.xenproject.org
X-Native-Encoded: 0
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.201dde821a22463199c8a2f98b00116a
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230323:md
Date: Thu, 23 Mar 2023 16:46:41 +0000
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_av-C3LEwsGhpAz73L6umw6VLg"

--_av-C3LEwsGhpAz73L6umw6VLg
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

XCP-ng and our friends at XenServer have a need to collect a number of informations inside guests, to give to
toolstacks and admins enough info to manage the guests properly. Today Xen downstreams have
to implement a guest agent for this when needed (see below), and we think it would be beneficial
to have one in the Xen Project, that could be configured for the needs of various downstreams.
Playing with this idea we started on several aspects:
- document what information needs to be collected and for what need, and propose a XenStore
structure (very preliminary ideas in [0]) 
- a prototype agent [1] that:
- could be used both as a replacement for what we use now, and for any improved data set we
would want, as well as any specific needs other downstreams may have
- would react on event where possible, to make changes visible ASAP to the toolstack
- would be multi-platform enough to run in (ideally) all guests
- we decided to write in Rust for various reasons [2]
We'd like to hear from the community what you think about those ideas.
What currently exists that we are aware of are:
- description for a few xenstore paths to store VIF information (iface name, MAC, IP addresses) [3]
- Xenserver's xe-guest-utilities, also used by XCP-ng; details of collected info in [4]
- until versions 6.x it was implemented as a Linux-specific shell-script daemon [5]
- this version has been forked for FreeBSD support [6]
- versions 7.x [7] are a rewrite in Go, which is slightly more efficient by using a single connection to
XenStore throughout its lifetime, but still uses a "spawn processes every minute" approach to
data collection; despite its design that should allow support for other OS than Linux, it has
not been extended for any (one user started a FreeBSD port, starting with conversion of the legacy
shell script still doing OS detection [8], but the effort stopped short of any modification of Go code).
- QubesOS' meminfo-writer [9]; only collects a "used memory" metric
- apparently nothing for OpenXT ([10] only mentions installing PV drivers for Windows)
[0] https://gitlab.com/ydirson/xen-guest-agent/-/blob/ydi/rust-proto/doc/structure.md [https://gitlab.com/ydirson/xen-guest-agent/-/blob/ydi/rust-proto/doc/structure.md]
[1] https://gitlab.com/ydirson/xen-guest-agent/-/tree/ydi/rust-proto [https://gitlab.com/ydirson/xen-guest-agent/-/tree/ydi/rust-proto]
https://gitlab.com/xen-project/xen-guest-agent/-/merge_requests/2
[2] https://xcp-ng.org/blog/2023/03/17/bringing-rust-to-the-xen-project/ [https://xcp-ng.org/blog/2023/03/17/bringing-rust-to-the-xen-project/]
[3] https://xenbits.xen.org/docs/unstable/misc/xenstore-paths.html#domain-controlled-paths [https://xenbits.xen.org/docs/unstable/misc/xenstore-paths.html#domain-controlled-paths]
[4] https://github.com/xenserver/xe-guest-utilities#collected-information-by-lifetime [https://github.com/xenserver/xe-guest-utilities#collected-information-by-lifetime]
[5] https://aur.archlinux.org/packages/xe-guest-utilities [https://aur.archlinux.org/packages/xe-guest-utilities]
[6] http://distcache.freebsd.org/local-distfiles/feld/xe-guest-utilities-6.0.2.tar.gz [http://distcache.freebsd.org/local-distfiles/feld/xe-guest-utilities-6.0.2.tar.gz]
[7] https://github.com/xenserver/xe-guest-utilities [https://github.com/xenserver/xe-guest-utilities]
[8] https://github.com/xcp-ng/xe-guest-utilities/pull/1 [https://github.com/xcp-ng/xe-guest-utilities/pull/1]
[9] https://gitlab.com/QubesOS/qubes-linux-utils/-/blob/master/qmemman/meminfo-writer.c [https://gitlab.com/QubesOS/qubes-linux-utils/-/blob/master/qmemman/meminfo-writer.c]
[10] https://openxt.atlassian.net/wiki/spaces/OD/pages/44924936/How+to+Install+Guest+VMs [https://openxt.atlassian.net/wiki/spaces/OD/pages/44924936/How+to+Install+Guest+VMs]


Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

--_av-C3LEwsGhpAz73L6umw6VLg
Content-Type: multipart/related; boundary="_av-Ty4B9oV-1NzI5gEn6GL9WA"

--_av-Ty4B9oV-1NzI5gEn6GL9WA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
 <head></head>
 <body>
  <div id="bm-composer-content-wrapper">
   <div id="bm-composer-content-wrapper">
    <div id="bm-composer-content-wrapper">
     <div id="bm-composer-content-wrapper">
      <div id="bm-composer-content-wrapper">
       <div id="bm-composer-content-wrapper">
        <div id="bm-composer-content-wrapper">
         <div id="bm-composer-content-wrapper">
          <div id="bm-composer-content-wrapper">
           <div id="bm-composer-content-wrapper">
            <div id="bm-composer-content-wrapper">
             <div id="bm-composer-content-wrapper">
              <div id="bm-composer-content-wrapper">
               <div id="bm-composer-content-wrapper">
                <div id="bm-composer-content-wrapper">
                 <div id="bm-composer-content-wrapper">
                  <div id="bm-composer-content-wrapper">
                   <div id="bm-composer-content-wrapper">
                    <div id="bm-composer-content-wrapper">
                     <div id="bm-composer-content-wrapper">
                      <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                       XCP-ng and our friends at XenServer have a need to collect a number of informations inside guests, to give to
                       <br>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        toolstacks and admins enough info to manage the guests properly.&nbsp; Today Xen downstreams have
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        to implement a guest agent for this when needed (see below), and we think it would be beneficial
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        to have one in the Xen Project, that could be configured for the needs of various downstreams.
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <br>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        Playing with this idea we started on several aspects:
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        - document what information needs to be collected and for what need, and propose a XenStore
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        &nbsp; structure (very preliminary ideas in [0])
                        <br>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        - a prototype agent [1] that:
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        &nbsp; - could be used both as a replacement for what we use now, and for any improved data set we
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        &nbsp; &nbsp;&nbsp; would want, as well as any specific needs other downstreams may have
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        &nbsp; - would react on event where possible, to make changes visible ASAP to the toolstack
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        &nbsp; - would be multi-platform enough to run in (ideally) all guests
                        <br>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        &nbsp; - we decided to write in Rust for various reasons [2]
                        <br>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <br>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        We'd like to hear from the community what you think about those ideas.
                        <br>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <br>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        What currently exists that we are aware of are:<span><span><br></span></span>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <span><span>- description for a few xenstore paths to store VIF information (iface name, MAC, IP addresses) [3]<br></span></span>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <span><span>-&nbsp;Xenserver's xe-guest-utilities, also used by XCP-ng; details of collected info in [4]<br></span></span>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <span><span>&nbsp; - until versions 6.x </span>it was implemented as a Linux-specific shell-script daemon [5]</span>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <span>&nbsp; - this version has been forked for FreeBSD support [6]</span>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <span>&nbsp; - versions 7.x [7] are a rewrite in Go, which is slightly more efficient by using a single connection to</span>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <span>&nbsp;&nbsp;&nbsp; XenStore throughout its lifetime, but still uses a "spawn processes every minute" approach to</span>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <span>&nbsp;&nbsp;&nbsp; data collection; despite its design that should allow support for other OS than Linux, it has</span>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <span>&nbsp;&nbsp;&nbsp; not been extended for any (one user started a FreeBSD port, starting with conversion of the legacy</span>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <span>&nbsp;&nbsp;&nbsp; shell script still doing OS detection [8], but the effort stopped short of any modification of Go code).<br></span>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <span style="font-size:9pt"><span>-&nbsp;QubesOS' meminfo-writer [9]</span><span>; only collects a "used memory" metric<br></span></span>
                        <div style="font-size:9pt">
                         <span></span>
                        </div><span>-&nbsp;apparently nothing for OpenXT ([10] only mentions installing PV drivers for Windows)<br></span><span></span>
                        <div style="font-size:9pt">
                         <br>
                        </div>
                        <div style="font-size:9pt">
                         <br>
                        </div>
                       </div>[0] <a href="https://gitlab.com/ydirson/xen-guest-agent/-/blob/ydi/rust-proto/doc/structure.md">https://gitlab.com/ydirson/xen-guest-agent/-/blob/ydi/rust-proto/doc/structure.md</a>
                      </div>
                      <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                       [1] <a href="https://gitlab.com/ydirson/xen-guest-agent/-/tree/ydi/rust-proto">https://gitlab.com/ydirson/xen-guest-agent/-/tree/ydi/rust-proto</a>
                      </div>
                      <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                       &nbsp;&nbsp;&nbsp; <a href="https://gitlab.com/xen-project/xen-guest-agent/-/merge_requests/2">https://gitlab.com/xen-project/xen-guest-agent/-/merge_requests/2</a>
                       <br>
                      </div>
                      <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                       [2] <a href="https://xcp-ng.org/blog/2023/03/17/bringing-rust-to-the-xen-project/">https://xcp-ng.org/blog/2023/03/17/bringing-rust-to-the-xen-project/</a>
                       <br>
                      </div>
                      <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                       [3] <a href="https://xenbits.xen.org/docs/unstable/misc/xenstore-paths.html#domain-controlled-paths">https://xenbits.xen.org/docs/unstable/misc/xenstore-paths.html#domain-controlled-paths</a>
                       <br>
                      </div>
                      <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                       [4] <a href="https://github.com/xenserver/xe-guest-utilities#collected-information-by-lifetime">https://github.com/xenserver/xe-guest-utilities#collected-information-by-lifetime</a>
                       <br>
                      </div>
                      <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                       [5] <a href="https://aur.archlinux.org/packages/xe-guest-utilities">https://aur.archlinux.org/packages/xe-guest-utilities</a>
                       <br>
                      </div>
                      <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                       [6] <a href="http://distcache.freebsd.org/local-distfiles/feld/xe-guest-utilities-6.0.2.tar.gz">http://distcache.freebsd.org/local-distfiles/feld/xe-guest-utilities-6.0.2.tar.gz</a>
                       <br>
                      </div>
                      <div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        [7] <a href="https://github.com/xenserver/xe-guest-utilities">https://github.com/xenserver/xe-guest-utilities</a>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        <span style="font-size:9pt">[8] <a href="https://github.com/xcp-ng/xe-guest-utilities/pull/1">https://github.com/xcp-ng/xe-guest-utilities/pull/1</a></span>
                        <div style="font-size:9pt"></div>[9] <a href="https://gitlab.com/QubesOS/qubes-linux-utils/-/blob/master/qmemman/meminfo-writer.c">https://gitlab.com/QubesOS/qubes-linux-utils/-/blob/master/qmemman/meminfo-writer.c</a>
                       </div>
                       <div style="font-family: &quot;Montserrat&quot;, sans-serif; font-size: 9pt; color: rgb(31, 31, 31);">
                        [10] <a href="https://openxt.atlassian.net/wiki/spaces/OD/pages/44924936/How+to+Install+Guest+VMs">https://openxt.atlassian.net/wiki/spaces/OD/pages/44924936/How+to+Install+Guest+VMs</a>
                       </div>
                       <br>
                      </div>
                     </div>
                    </div>
                   </div>
                  </div>
                 </div>
                </div>
               </div>
              </div>
             </div>
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
   <style></style>
  </div>
  <div class="x-disclaimer-900425384">
   <div>
     &nbsp;
   </div>
   <div>
     &nbsp;
   </div>
   <div>
    <div>
     <br>
     <table>
      <tbody>
       <tr>
        <td style="font-size: 10pt;">&nbsp;</td>
        <td style="font-size: 10pt; padding-left: 20px; border-left-color: #b42626; border-left-style: solid; border-left-width: 1px;">
         <div> <strong> Yann Dirson | Vates Platform Developer</strong>
         </div>
         <div> <strong></strong>
         </div>
         <div> <strong>XCP-ng &amp; Xen Orchestra - </strong>Vates solutions
         </div>
         <div> <strong>w:</strong>&nbsp;vates.fr&nbsp;| xcp-ng.org | xen-orchestra.com
         </div>
         <div>
          <img style="float: left;" src="cid:x-disclaimer-900425384-1679590000503.png@bm-disclaimer" alt="" width="174" height="159">
         </div> </td>
       </tr>
      </tbody>
     </table>
    </div>
   </div>
  </div>
 <img src="https://mandrillapp.com/track/open.php?u=30504962&id=201dde821a22463199c8a2f98b00116a" height="1" width="1" alt=""></body>
</html>

--_av-Ty4B9oV-1NzI5gEn6GL9WA
Content-Type: image/png
Content-Transfer-Encoding: base64
Content-Id: <x-disclaimer-900425384-1679590000503.png@bm-disclaimer>
Content-Disposition: inline

iVBORw0KGgoAAAANSUhEUgAAAK4AAACfCAYAAABgKuLmAAAm4XpUWHRSYXcg
cHJvZmlsZSB0eXBlIGV4aWYAAHjatZxpkmSpcoX/swotgXlYDuBgph1o+foO
kVmva2jZa8lU1VWZFRlxL+DuZ3C47c5//ed1/8GvEYZ3ubReR62eX3nkESff
dP/5Nd/fwef39+el8/Wz8PPrbtyvH0ReSnxNn3/2+vX+79fDjwt8vky+K3+5
UN9fP1g//2Dkr+v3Xy70daOkEUW+se8RfV0oxc8PwtcF5mdavo7e/jqF9TW1
r89/loE/Tn/dHYdeK+vzs1//nRurZ4X7pBhPCsnzd0pfA0j6E12afFP5O6YU
30vvlc7fIcWvkbAgf1qnH7+4rbsaav7jm36Kyo/vfonWGV9r9Gu0cvx6S/pl
keuPr3983YXy56i8pf/LnXP/+i7+/ProMX5G9Mvqv8W/1u+bM7OYubLU9WtS
31N83/E+wpF16+4YWvWNP4VLtPd78LuT1ZtUML/94vcOI0TCdUMOFma44byv
O2yGmONxsfFNjDum92JPLY64iVtIWb/DjS2NZMQxpv3CnlP8MZbwbjv8du9u
nTtb4K0xcLHwkuAf/nb/9AP3qhRC0FoS+vCJb4xabIahyOlv3kZEwv1a1PIW
+Pv3r78U10QEi1ZZJTJY2PW5xCrhX0iQXqATbyx8/dRgaPZ1AZaIWxcGExIR
IGohlVCDbzG2EFjIToAmQ48px0UEQinRGGTMKVVi06NuzUdaeG+NJfKy43XA
jEgUKq4Rm5Emwcq5kD8td3JollRyKaWWVnoZZdZUcy211lYFirOlll0rrbbW
ehtt9tRzL7321nsffY44EqBZRh1t9DHGnNxzcuXJpydvmHPFlVZexa262upr
rLlJn5132XW33ffY06IlAz+sWrNuw+YJh1Q6+ZRTTzv9jDMvqXaTu/mWW2+7
/Y47f0TtK6y//f4HUQtfUYsvUnpj+xE1Xm3t+xJBcFIUMwIWXQ5EvCkEJHRU
zHwPOUdFTjHzA8RLJTLIophZUMSIYD4hlhu+Y+fiJ6KK3P8pbq7ln+IW/7eR
cwrdP4zc73H7U9RMNLRfxD5VqEX1ierj56fP2KfI7revTjNvjRUI8HbqXrdv
xdvlv139mjVY7qcXSmjvnE4bo8XF2Po+56wzNhTXorNcILFSOrVFGe7A9LnF
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
ivS52PKsqh/DhTZQhbdKLSMr9RzK0D4j2ZIMnNl6eNSTqdXpiT+CgEfpLHuT
avpEuuAFlKY6Y+kTSLBAfjSf9uY/R7DexlQNldie5ChkcdeM7+i72nY23H8D
uWZ05wi91FUAAAGEaUNDUElDQyBwcm9maWxlAAB4nH2RPUjDQBzFX1O1IhUH
C4o4ZKhOFqSKOGoVilAh1AqtOphc+iE0aUhSXBwF14KDH4tVBxdnXR1cBUHw
A8TRyUnRRUr8X1JoEePBcT/e3XvcvQOEeplpVsc4oOm2mU4mxGxuRQy9ogsD
iCCEuMwsY1aSUvAdX/cI8PUuxrP8z/05etW8xYCASDzDDNMmXiee2rQNzvvE
EVaSVeJz4jGTLkj8yHXF4zfORZcFnhkxM+k54gixWGxjpY1ZydSIJ4mjqqZT
vpD1WOW8xVkrV1nznvyF4by+vMR1msNIYgGLkCBCQRUbKMNGjFadFAtp2k/4
+Idcv0QuhVwbYOSYRwUaZNcP/ge/u7UKE3EvKZwAOl8c52MECO0CjZrjfB87
TuMECD4DV3rLX6kD05+k11pa9Ajo2wYurluasgdc7gCDT4Zsyq4UpCkUCsD7
GX1TDui/BXpWvd6a+zh9ADLUVeoGODgERouUvebz7u723v490+zvB3gHcqkl
oKXxAAAN/WlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJl
Z2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6
eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1Q
IENvcmUgNC40LjAtRXhpdjIiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRw
Oi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8
cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgeG1sbnM6eG1wTU09
Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iCiAgICB4bWxuczpz
dEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291
cmNlRXZlbnQjIgogICAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9l
bGVtZW50cy8xLjEvIgogICAgeG1sbnM6R0lNUD0iaHR0cDovL3d3dy5naW1w
Lm9yZy94bXAvIgogICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNv
bS90aWZmLzEuMC8iCiAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5j
b20veGFwLzEuMC8iCiAgIHhtcE1NOkRvY3VtZW50SUQ9ImdpbXA6ZG9jaWQ6
Z2ltcDo5NmE3ZjI0MS1lMjNjLTRiMWEtOTdjZS1kNmU2NjliOTk4ZTIiCiAg
IHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MGNlZmJjNjYtNjFiMy00ZDZk
LWExYzgtMTg5M2QwNWFjOTg5IgogICB4bXBNTTpPcmlnaW5hbERvY3VtZW50
SUQ9InhtcC5kaWQ6NDIyZDdlNTItOGE2Ny00NmExLWI5MjYtNTJiOGEzMGIx
OGIwIgogICBkYzpGb3JtYXQ9ImltYWdlL3BuZyIKICAgR0lNUDpBUEk9IjIu
MCIKICAgR0lNUDpQbGF0Zm9ybT0iTGludXgiCiAgIEdJTVA6VGltZVN0YW1w
PSIxNjU2MDE0ODk0NDU0Mjg5IgogICBHSU1QOlZlcnNpb249IjIuMTAuMzAi
CiAgIHRpZmY6T3JpZW50YXRpb249IjEiCiAgIHhtcDpDcmVhdG9yVG9vbD0i
R0lNUCAyLjEwIj4KICAgPHhtcE1NOkhpc3Rvcnk+CiAgICA8cmRmOlNlcT4K
ICAgICA8cmRmOmxpCiAgICAgIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiCiAgICAg
IHN0RXZ0OmNoYW5nZWQ9Ii8iCiAgICAgIHN0RXZ0Omluc3RhbmNlSUQ9Inht
cC5paWQ6YTY0MGI4MmMtMDg0My00MjYwLTk3NmMtYTg1ZjA3MDc5ZjcwIgog
ICAgICBzdEV2dDpzb2Z0d2FyZUFnZW50PSJHaW1wIDIuMTAgKExpbnV4KSIK
ICAgICAgc3RFdnQ6d2hlbj0iMjAyMi0wNC0yOVQxMzoyMzo1NCswMjowMCIv
PgogICAgIDxyZGY6bGkKICAgICAgc3RFdnQ6YWN0aW9uPSJzYXZlZCIKICAg
ICAgc3RFdnQ6Y2hhbmdlZD0iLyIKICAgICAgc3RFdnQ6aW5zdGFuY2VJRD0i
eG1wLmlpZDozYTUyMDNkNS04NGRiLTQzNDMtOWZhYy03NjFmZDZmZmFhYjgi
CiAgICAgIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkdpbXAgMi4xMCAoTGludXgp
IgogICAgICBzdEV2dDp3aGVuPSIyMDIyLTA2LTIzVDIyOjA4OjE0KzAyOjAw
Ii8+CiAgICA8L3JkZjpTZXE+CiAgIDwveG1wTU06SGlzdG9yeT4KICA8L3Jk
ZjpEZXNjcmlwdGlvbj4KIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAKPD94cGFja2V0IGVuZD0idyI/PlmiVpAAAAAG
YktHRADwAKIAftw2PhcAAAAJcEhZcwAALiMAAC4jAXilP3YAAAAHdElNRQfm
BhcUCA56CWQaAAAgAElEQVR42ux9Z5gkV3X2e+6tqk4Td3d2epN2tUlhJRSQ
QEKABpFE/ggm2SAMxmBbtjA2/uwPJ2wwGNs8BBuDbTAyOdnYGIEtECMhhISQ
YIXianOc2Z3diR2r7j3fj3sqdO/M7Ehik9TneXq3p7u6uvrWe8894T3nEjry
mOWnT79UFdaUledrUoFPBADWAgzYRoio3rTR2CQfuW/UPuPgdu6M2GMX6gzB
I5MvAuqiN7+8N9/f1Uta94C5xzbCZQCWE/MSUqoLzAFZVrAccWRqNoomOTIj
1vIBT6uDNjTTptqYmtkxOnHR5ntqnVHtAPe4yAcA9aprX3O231N6ktJ6E0Ab
CLyWmc8gYFApBTADlsHWAswgZsAwYC3YMmAsODKwYVSHtXs4srvYmK22GT1g
a817p3cdvOein9871hntDnAfs4x95DeWB+XBl0S18MW1feMbibEUhD4AgAXA
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
AAAASUVORK5CYII=

--_av-Ty4B9oV-1NzI5gEn6GL9WA--

--_av-C3LEwsGhpAz73L6umw6VLg--


