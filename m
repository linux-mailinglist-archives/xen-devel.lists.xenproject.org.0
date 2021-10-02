Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABA241FC6F
	for <lists+xen-devel@lfdr.de>; Sat,  2 Oct 2021 16:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201077.355495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWfgb-0004VG-Kc; Sat, 02 Oct 2021 14:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201077.355495; Sat, 02 Oct 2021 14:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWfgb-0004Si-HO; Sat, 02 Oct 2021 14:08:21 +0000
Received: by outflank-mailman (input) for mailman id 201077;
 Sat, 02 Oct 2021 14:08:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+enT=OW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mWfgZ-0004Sc-PQ
 for xen-devel@lists.xenproject.org; Sat, 02 Oct 2021 14:08:19 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2fcc462-1edb-45e6-bf61-5adb574e05c9;
 Sat, 02 Oct 2021 14:08:16 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i25so50446655lfg.6
 for <xen-devel@lists.xenproject.org>; Sat, 02 Oct 2021 07:08:16 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 11sm228781lfr.267.2021.10.02.07.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:08:15 -0700 (PDT)
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
X-Inumbo-ID: e2fcc462-1edb-45e6-bf61-5adb574e05c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=QMUC0K2Ps8HQjCCG1Rlh7+xCnhuD+dz8MT5HW5UUGps=;
        b=UlzfPaEQaV2hZPjLC1FuubUQ15iBXQ5E7MzzZUMkbs8AJA0VKDwk6OcgLzpOMq9BAw
         2X3CDgk3q9tM1iV7y1kNoswSwzHXoGKUt9e7Aj7BFNnRjrjZK5ltF0Qpfu4j6yHl9ZPN
         k+CIQxCK9eq6T/5y34wQVf0mtrctfeGmULb7ByfjRj7TnSYzkxb4VZwOoeQjq26Sw5gO
         vkHVh1CeJkKCRn/bnb5UWF3lfLNM2cEiHVc7C5FQcVERsX9UVlvpiRtjny1Xph8gFDPw
         opLty+ApLNdGgfkgG4GSnZKN82YYmi0OHKC5wjDEm63JhVdUXPHjYriupFA2ha6LVGia
         IjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=QMUC0K2Ps8HQjCCG1Rlh7+xCnhuD+dz8MT5HW5UUGps=;
        b=46n44pg8IvejdVGW53/TSVlmvXckOe4aYJGB+q4X32ecl5QyaczdSzpfTJIEaq4yu3
         nvz/4zH8GOMUX31PK0HK7SvtxvWKl/c7mq2fg6G+d/+wXI/H1JwvuLxBCDx696s4oJlm
         VDW5oDWV5z/dktcY0/5ApLby+NuCh4IXfPdkE6qV9vdTi9wS9Q9a61SoUc8HbYWw+HZy
         H5s2zGs8yHLOiQFxJfx5+XHOLU72H5FOSGKRSXVtjYnHXMFAmd7P2Z4HsTi7ToZ1TF5c
         v8TS/fBIlLrZNL9IqsvC4d73pZLVTeMsANptOfyCn9FRMwjtjC35iyrpg6/tYYqA/vse
         Em0Q==
X-Gm-Message-State: AOAM531Nic0w/2fVeFskDtTUuxSueYaea+8pIGP866YoXrNR7q1vY+WS
	hS3xaxJ8v+6u+8gQJfQNUDUk1v81XV8=
X-Google-Smtp-Source: ABdhPJxapSDc6xMCl8RqWJHvN+p1EeZLF/wKTOoPbLaGRLTvfiSqr/7QAaSwOb8L8mgtwHEVFN1h5Q==
X-Received: by 2002:a05:6512:3d13:: with SMTP id d19mr3743813lfv.607.1633183695752;
        Sat, 02 Oct 2021 07:08:15 -0700 (PDT)
Subject: Re: [PATCH V4 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
To: Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-2-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109301600060.3209@sstabellini-ThinkPad-T480s>
 <05b040b0-a069-47a1-1f5e-85be62fa35f3@suse.com>
 <bbbceae1-c382-5e48-0c6b-fbb23fc720f5@gmail.com>
 <alpine.DEB.2.21.2110011244000.3209@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2bT4tMn2argJzePUMR2Ke4bmabj+j5QevvwpfnA9ST_w@mail.gmail.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <093bc1d5-bf6a-da0a-78b5-7a8dd471a063@gmail.com>
Date: Sat, 2 Oct 2021 17:08:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJ=z9a2bT4tMn2argJzePUMR2Ke4bmabj+j5QevvwpfnA9ST_w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------1CA69BF45EAC1E3C26988D15"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1CA69BF45EAC1E3C26988D15
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02.10.21 10:35, Julien Grall wrote:

Hi Julien, Stefano.


Thank you for your comments!

> Hi
>
> On Sat, 2 Oct 2021, 01:24 Stefano Stabellini, <sstabellini@kernel.org 
> <mailto:sstabellini@kernel.org>> wrote:
>
>     Bertrand, see comment on ID_AA64MMFR0_EL1 below, any ideas?
>
>
>     On Fri, 1 Oct 2021, Oleksandr wrote:
>     > On 01.10.21 10:50, Jan Beulich wrote:
>     > > On 01.10.2021 01:00, Stefano Stabellini wrote:
>     > > > On Thu, 30 Sep 2021, Oleksandr Tyshchenko wrote:
>     > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com
>     <mailto:oleksandr_tyshchenko@epam.com>>
>     > > > >
>     > > > > We need to pass info about maximum supported guest address
>     > > > > space size to the toolstack on Arm in order to properly
>     > > > > calculate the base and size of the extended region (safe
>     range)
>     > > > > for the guest. The extended region is unused address space
>     which
>     > > > > could be safely used by domain for foreign/grant mappings
>     on Arm.
>     > > > > The extended region itself will be handled by the subsequents
>     > > > > patch.
>     > > > >
>     > > > > Use p2m_ipa_bits variable on Arm, the x86 equivalent is
>     > > > > hap_paddr_bits.
>     > > > >
>     > > > > As we change the size of structure bump the interface version.
>     > > > >
>     > > > > Suggested-by: Julien Grall <jgrall@amazon.com
>     <mailto:jgrall@amazon.com>>
>     > > > > Signed-off-by: Oleksandr Tyshchenko
>     <oleksandr_tyshchenko@epam.com <mailto:oleksandr_tyshchenko@epam.com>>
>     > > > > Reviewed-by: Michal Orzel <michal.orzel@arm.com
>     <mailto:michal.orzel@arm.com>>
>     > > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org
>     <mailto:sstabellini@kernel.org>>
>     > > I have to admit that I'm a little puzzled to see these R-b-s
>     when ...
>     > >
>     > > > > Please note, that review comments for the RFC version [1]
>     haven't been
>     > > > > addressed yet.
>     > > > > It is not forgotten, some clarification is needed. It will
>     be addressed
>     > > > > for the next version.
>     > > > >
>     > > > > [1]
>     > > > >
>     https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/
>     > > ... Oleksandr makes clear this patch isn't really ready yet.
>     >
>     > Unfortunately, this is true. I am still waiting for the
>     clarification [1]
>
>     Although I was aware of comments to older versions, this is
>     actually the
>     first version of this patch that I reviewed with any level of
>     details; I
>     didn't read previous comments very closely. I tried to find any
>     bugs or
>     problems with it and I couldn't see any, so I gave my reviewed-by. I
>     should have clarified that was meant for the ARM part as I don't
>     have a
>     full understanding of the implications of using hap_paddr_bits on x86
>     for VM migration.
>
>
>
>     But let me take this opportunity to say that although I think the
>     hypercall is OK, I wish we didn't need this patch at all: it is
>     problematic because it touches tools, x86 and ARM hypervisor code all
>     together. It needs at least three acks/reviewed-by to get
>     accepted: from
>     an x86 maintainer, an arm maintainer and from a tools maintainer. I
>     don't say this to criticize the patch acceptance process: this patch
>     makes changes to an existing hypercall so it is only fair that it
>     needs
>     to go through extra levels of scrutiny. For the sake of simplicity and
>     decoupling (reducing dependencies between patches and between
>     components), I think it would be best to introduce an #define for the
>     minimum value of gpaddr_bits and then move this patch at the end
>     of the
>     series; that way it becomes optional.
>
>
> It depends what you mean by optional. Yes we can add hack to avoid the 
> hypercall... But the more scalable solution is the hypercall.
>
> I am slightly concerned that if we don't push for the hypercall now, 
> then there will be no incentive to do it afterwards...
>
> So I went through Andrew's e-mail to understand what's the request. I 
> understand that there are some problem with migration. But it doesn't 
> look like we need to solve them now. Instead,  AFAICT, his main ask 
> for this series is to switch to a domctl.
>
> It seems the conversation is simply stuck on waiting for Andrew to 
> provide details on what would look like. Did we ping Andrew on IRC?
>
>     Unfortunately the minimum value
>     is 32 (in practice I have never seen less than 40 but the architecture
>     supports 32 as minimum).
>
>
>
>     Actually, the info we are looking for is already exposed via
>     ID_AA64MMFR0_EL1. ID_AA64MMFR0_EL1 can be read from a virtual machine,
>     and Linux let userspace read it [1]. Regardless of this patch
>     series, we
>     should make sure that Xen exposes the right mm64.pa_range value to
>     guest
>     virtual machines. If that is done right, then you can just add support
>     for reading ID_AA64MMFR0_EL1 in libxl/libxc and then we don't need any
>     hypercall modifications changes.
>
>
> From my understanding, from a VM PoV "pa_range" should represent the 
> size of the guest physical address space.
>
> Today, it happens that every VM is using the same P2M size. However, I 
> would rather not make such assumption in the userspace.
>
>
>     So, in theory we already have all the interfaces we need, but in
>     practice they don't work: unfortunaly both Xen and Linux mark
>     ID_AA64MMFR0_EL1 as FTR_HIDDEN in cpufeature.c so neither Linux from
>     Xen, not userspace from Linux can actually read the real value :-/
>     They always read zero.
>
>     (Also I think we have an issue today with p2m_restrict_ipa_bits not
>     updating the mm64.pa_range value. I think that it should be fixed.)
>
>
> It looks like it. That should be handled in a separate patch though.
>
>
>     Bertrand, do you have any ideas in regards to ID_AA64MMFR0_EL1?
>
>     If not, maybe we could just go with
>     #define MIN_GPADDR_BITS 32.
>
>
> The toolstack would have to consider it as the "maximum" because it 
> may not be safe to expose anything above.
>
> With 32, we are going to be limited in term of space we can find.
>
> We could potentially use 40 bits as a minimum. Although it still feels 
> a bit of a hack to me given that the IOMMU may restrict it further and 
> the architecture can in theory support less.
>
> Overall, I still strongly prefer the hypercall approach. If a common 
> one is difficult to achieve, then we can extend the domctl to create a 
> domain to provide the p2m_bits (in the same way as we deal for the GIC 
> version) in an arch specific way.


To summarize:
If we don't query the hypervisor to provide gpaddr_bits we have two options:
- The safe option is to use minimum possible value which is 32 bits on 
Arm64. But, there would be of no practical use.
- The unsafe option is to use let's say "default" 40 bits and pray it 
will work in all cases on Arm64 (it is ok on Arm32).

So we definitely need to query the hypervisor. As it turned out the 
sysctl approach is not welcome, in the long term we want to have this 
information per domain. I have been absolutely OK with that valid ask 
since RFC, I just wanted to know what was the preferred way to do this 
(new domctl, existing, etc)...

I analyzed what Julien had suggested regarding pass gpaddr_bits via 
Arm's struct xen_arch_domainconfig (I assume, this should be an OUT 
parameter) and I think it makes sense. Taking into the account that the 
feature freeze date is coming, I will wait a few days, and if there are 
no objections I will send updated version (patch #3 also needs updating 
as it expects the gpaddr_bits to be in physinfo).


>
> Cheers,
>
>
>
>     [1]
>     https://01.org/linuxgraphics/gfx-docs/drm/arm64/cpu-feature-registers.html
>
-- 
Regards,

Oleksandr Tyshchenko


--------------1CA69BF45EAC1E3C26988D15
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02.10.21 10:35, Julien Grall wrote:</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Hi Julien, Stefano.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Thank you for your comments!<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <blockquote type="cite"
cite="mid:CAJ=z9a2bT4tMn2argJzePUMR2Ke4bmabj+j5QevvwpfnA9ST_w@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">
        <div>Hi<br>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Sat, 2 Oct 2021, 01:24
              Stefano Stabellini, &lt;<a
                href="mailto:sstabellini@kernel.org" target="_blank"
                rel="noreferrer" moz-do-not-send="true">sstabellini@kernel.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Bertrand,
              see comment on ID_AA64MMFR0_EL1 below, any ideas?<br>
              <br>
              <br>
              On Fri, 1 Oct 2021, Oleksandr wrote:<br>
              &gt; On 01.10.21 10:50, Jan Beulich wrote:<br>
              &gt; &gt; On 01.10.2021 01:00, Stefano Stabellini wrote:<br>
              &gt; &gt; &gt; On Thu, 30 Sep 2021, Oleksandr Tyshchenko
              wrote:<br>
              &gt; &gt; &gt; &gt; From: Oleksandr Tyshchenko &lt;<a
                href="mailto:oleksandr_tyshchenko@epam.com"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">oleksandr_tyshchenko@epam.com</a>&gt;<br>
              &gt; &gt; &gt; &gt; <br>
              &gt; &gt; &gt; &gt; We need to pass info about maximum
              supported guest address<br>
              &gt; &gt; &gt; &gt; space size to the toolstack on Arm in
              order to properly<br>
              &gt; &gt; &gt; &gt; calculate the base and size of the
              extended region (safe range)<br>
              &gt; &gt; &gt; &gt; for the guest. The extended region is
              unused address space which<br>
              &gt; &gt; &gt; &gt; could be safely used by domain for
              foreign/grant mappings on Arm.<br>
              &gt; &gt; &gt; &gt; The extended region itself will be
              handled by the subsequents<br>
              &gt; &gt; &gt; &gt; patch.<br>
              &gt; &gt; &gt; &gt; <br>
              &gt; &gt; &gt; &gt; Use p2m_ipa_bits variable on Arm, the
              x86 equivalent is<br>
              &gt; &gt; &gt; &gt; hap_paddr_bits.<br>
              &gt; &gt; &gt; &gt; <br>
              &gt; &gt; &gt; &gt; As we change the size of structure
              bump the interface version.<br>
              &gt; &gt; &gt; &gt; <br>
              &gt; &gt; &gt; &gt; Suggested-by: Julien Grall &lt;<a
                href="mailto:jgrall@amazon.com" rel="noreferrer
                noreferrer" target="_blank" moz-do-not-send="true">jgrall@amazon.com</a>&gt;<br>
              &gt; &gt; &gt; &gt; Signed-off-by: Oleksandr Tyshchenko
              &lt;<a href="mailto:oleksandr_tyshchenko@epam.com"
                rel="noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">oleksandr_tyshchenko@epam.com</a>&gt;<br>
              &gt; &gt; &gt; &gt; Reviewed-by: Michal Orzel &lt;<a
                href="mailto:michal.orzel@arm.com" rel="noreferrer
                noreferrer" target="_blank" moz-do-not-send="true">michal.orzel@arm.com</a>&gt;<br>
              &gt; &gt; &gt; Reviewed-by: Stefano Stabellini &lt;<a
                href="mailto:sstabellini@kernel.org" rel="noreferrer
                noreferrer" target="_blank" moz-do-not-send="true">sstabellini@kernel.org</a>&gt;<br>
              &gt; &gt; I have to admit that I'm a little puzzled to see
              these R-b-s when ...<br>
              &gt; &gt; <br>
              &gt; &gt; &gt; &gt; Please note, that review comments for
              the RFC version [1] haven't been<br>
              &gt; &gt; &gt; &gt; addressed yet.<br>
              &gt; &gt; &gt; &gt; It is not forgotten, some
              clarification is needed. It will be addressed<br>
              &gt; &gt; &gt; &gt; for the next version.<br>
              &gt; &gt; &gt; &gt; <br>
              &gt; &gt; &gt; &gt; [1]<br>
              &gt; &gt; &gt; &gt; <a
href="https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/"
                rel="noreferrer noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/</a><br>
              &gt; &gt; ... Oleksandr makes clear this patch isn't
              really ready yet.<br>
              &gt; <br>
              &gt; Unfortunately, this is true. I am still waiting for
              the clarification [1]<br>
              <br>
              Although I was aware of comments to older versions, this
              is actually the<br>
              first version of this patch that I reviewed with any level
              of details; I<br>
              didn't read previous comments very closely. I tried to
              find any bugs or<br>
              problems with it and I couldn't see any, so I gave my
              reviewed-by. I<br>
              should have clarified that was meant for the ARM part as I
              don't have a<br>
              full understanding of the implications of using
              hap_paddr_bits on x86<br>
              for VM migration.</blockquote>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              <br>
              But let me take this opportunity to say that although I
              think the<br>
              hypercall is OK, I wish we didn't need this patch at all:
              it is<br>
              problematic because it touches tools, x86 and ARM
              hypervisor code all<br>
              together. It needs at least three acks/reviewed-by to get
              accepted: from<br>
              an x86 maintainer, an arm maintainer and from a tools
              maintainer. I<br>
              don't say this to criticize the patch acceptance process:
              this patch<br>
              makes changes to an existing hypercall so it is only fair
              that it needs<br>
              to go through extra levels of scrutiny. For the sake of
              simplicity and<br>
              decoupling (reducing dependencies between patches and
              between<br>
              components), I think it would be best to introduce an
              #define for the<br>
              minimum value of gpaddr_bits and then move this patch at
              the end of the<br>
              series; that way it becomes optional.</blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">It depends what you mean by optional. Yes we can
          add hack to avoid the hypercall... But the more scalable
          solution is the hypercall.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">I am slightly concerned that if we don't push
          for the hypercall now, then there will be no incentive to do
          it afterwards...</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">So I went through Andrew's e-mail to understand
          what's the request. I understand that there are some problem
          with migration. But it doesn't look like we need to solve them
          now. Instead,  AFAICT, his main ask for this series is to
          switch to a domctl.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">It seems the conversation is simply stuck on
          waiting for Andrew to provide details on what would look like.
          Did we ping Andrew on IRC?</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              Unfortunately the minimum value<br>
              is 32 (in practice I have never seen less than 40 but the
              architecture<br>
              supports 32 as minimum).</blockquote>
          </div>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              <br>
              Actually, the info we are looking for is already exposed
              via<br>
              ID_AA64MMFR0_EL1. ID_AA64MMFR0_EL1 can be read from a
              virtual machine,<br>
              and Linux let userspace read it [1]. Regardless of this
              patch series, we<br>
              should make sure that Xen exposes the right mm64.pa_range
              value to guest<br>
              virtual machines. If that is done right, then you can just
              add support<br>
              for reading ID_AA64MMFR0_EL1 in libxl/libxc and then we
              don't need any<br>
              hypercall modifications changes.</blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">From my understanding, from a VM PoV "pa_range"
          should represent the size of the guest physical address space.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Today, it happens that every VM is using the
          same P2M size. However, I would rather not make such
          assumption in the userspace.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              So, in theory we already have all the interfaces we need,
              but in<br>
              practice they don't work: unfortunaly both Xen and Linux
              mark<br>
              ID_AA64MMFR0_EL1 as FTR_HIDDEN in cpufeature.c so neither
              Linux from<br>
              Xen, not userspace from Linux can actually read the real
              value :-/<br>
              They always read zero.<br>
              <br>
              (Also I think we have an issue today with
              p2m_restrict_ipa_bits not<br>
              updating the mm64.pa_range value. I think that it should
              be fixed.)</blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">It looks like it. That should be handled in a
          separate patch though.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              Bertrand, do you have any ideas in regards to
              ID_AA64MMFR0_EL1?<br>
              <br>
              If not, maybe we could just go with<br>
              #define MIN_GPADDR_BITS 32.</blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">The toolstack would have to consider it as the
          "maximum" because it may not be safe to expose anything above.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">With 32, we are going to be limited in term of
          space we can find.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">We could potentially use 40 bits as a minimum.
          Although it still feels a bit of a hack to me given that the
          IOMMU may restrict it further and the architecture can in
          theory support less.</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Overall, I still strongly prefer the hypercall
          approach. If a common one is difficult to achieve, then we can
          extend the domctl to create a domain to provide the p2m_bits
          (in the same way as we deal for the GIC version) in an arch
          specific way.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    To summarize:<br>
    If we don't query the hypervisor to provide gpaddr_bits we have two
    options:<br>
    - The safe option is to use minimum possible value which is 32 bits
    on Arm64. But, there would be of no practical use.<br>
    - The unsafe option is to use let's say "default" 40 bits and pray
    it will work in all cases on Arm64 (it is ok on Arm32).<br>
    <br>
    So we definitely need to query the hypervisor. As it turned out the
    sysctl approach is not welcome, in the long term we want to have
    this information per domain. I have been absolutely OK with that
    valid ask since RFC, I just wanted to know what was the preferred
    way to do this (new domctl, existing, etc)...<br>
    <br>
    I analyzed what Julien had suggested regarding pass gpaddr_bits via
    Arm's struct xen_arch_domainconfig (I assume, this should be an OUT
    parameter) and I think it makes sense. Taking into the account that
    the feature freeze date is coming, I will wait a few days, and if
    there are no objections I will send updated version (patch #3 also
    needs updating as it expects the gpaddr_bits to be in physinfo).<br>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAJ=z9a2bT4tMn2argJzePUMR2Ke4bmabj+j5QevvwpfnA9ST_w@mail.gmail.com">
      <div dir="auto">
        <div dir="auto"><br>
        </div>
        <div dir="auto">Cheers,</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              <br>
              [1] <a
href="https://01.org/linuxgraphics/gfx-docs/drm/arm64/cpu-feature-registers.html"
                rel="noreferrer noreferrer noreferrer" target="_blank"
                moz-do-not-send="true">https://01.org/linuxgraphics/gfx-docs/drm/arm64/cpu-feature-registers.html</a><br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Regards,

Oleksandr Tyshchenko</pre>
  </body>
</html>

--------------1CA69BF45EAC1E3C26988D15--

