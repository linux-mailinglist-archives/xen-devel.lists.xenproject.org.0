Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2233FE8612
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 11:49:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPP18-0005z4-EH; Tue, 29 Oct 2019 10:46:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xwdt=YW=ts.fujitsu.com=dietmar.hahn@srs-us1.protection.inumbo.net>)
 id 1iPP16-0005yw-RW
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 10:46:25 +0000
X-Inumbo-ID: 5809c7da-fa39-11e9-a531-bc764e2007e4
Received: from mail1.bemta25.messagelabs.com (unknown [195.245.230.3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5809c7da-fa39-11e9-a531-bc764e2007e4;
 Tue, 29 Oct 2019 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ts.fujitsu.com;
 s=200619tsfj; t=1572345980; i=@ts.fujitsu.com;
 bh=gZjeM7x0Kbrw1ILYb+O15J153TQ+YtOIb65yyIaikZU=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=LlRhL/1HDIs7UguhFUEyOyNyWBbuc9VowbuKWNC/jH3W+IRg1RPVMP/+j3TznWgcy
 YK1cIWT4/9WmViQeCIDnLr6nF4QLkCKjJvRFy1UwQiIrAYbWQSJPazdx/+v8HhCLhv
 d4Pw439zGkvl7Mi2nlrDYf0SzdBNG4dr8YT4uvDT+MxmGeikd5W4RWglkzmlWCD1XT
 v4szSFA5G0Teh1kuS8BAhR+eC87gyzjUnorx1zisrk24xgkj62nFjGLc/8HW52OKmv
 YmLtHrpeAmLJzmBo2R5h5Sz51pvh/wv9jdXAlIT25Kswxg4KLytnHamCl2cJJrMFxG
 233aAeEQfmPxA==
Received: from [46.226.52.101] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.eu-west-1.aws.symcld.net id BF/72-31201-C7818BD5;
 Tue, 29 Oct 2019 10:46:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRWlGSWpSXmKPExsViZ8MRqlstsSP
 W4MlPM4tZW8Utfu55yGaxZMkPRovJ96+xW3zfMpnJgdVj1eZtTB4rLnSxehz+cIXFY/2WqywB
 LFGsmXlJ+RUJrBntU2YxFaypq2h4fYe9gfFAYRcjF4eQwBxGiX23HjFCOPMZJQ5Oec3SxcjJw
 SZgILHr1SFmEFtEQEni3qrJTCBFzAI7GCXuzr8F5ggLdDFKzPm0mx2kikVAVeLdhS6wbl4BQ4
 nli3aD2ZwCdhL3/p1jBbGFBGwlnl9bwwpRIyhxcuYTsBpmAS+JpzvnQ9nyEh2XG1knMPLOQlI
 2C0nZLCRlmGwdiQW7P7FhimtLnDnwmGkBI/sqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sTXUMz
 c73EKt1EvdRS3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwAhJKTi0fAfj/y9v9Q4xSnIwKYny/
 jm2PVaILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO9n8R2xQoJFqempFWmZOcBohUlLcPAoifC+Fw
 NK8xYXJOYWZ6ZDpE4xhnNcvj5vETPH2X8g8uOqJUDyO5h8sxZEvgWTbffuAsl2ECnEkpeflyo
 lzssFsk0AZFxGaR7cMlgyusQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHctyFE8mXklcDe9
 AjqXCehcnZ/bQM4tSURISTUwWcilmz55IeW3vteQ//NB/38KO9for3Ncw/Lm7T/tO6x6zb/tH
 n7dl6YY2cvrzdl3/Z3EjmxJ97klwq80LL0+fxKoebEyp2qlb6uAbbHbjZ3dazR8ut3N/qS8uu
 7lyyhwt1LzlYKtfuIV+7i2BTa6yoqRB6L4fFXX7ngatufBqygz53kfpknd2q48acdx8xrprau
 FGllceNxVIk4ysX5PvSihsNxLOmfv3Z8PYxdWT98keu181puTjpXhfn3Z6lPfLRUOzI2Qv89n
 zfHqkMIC/dZazcVP/twRuBFcJKJlKfrg0H1Vbc05wd5ZSx4GWnzd3+ZQsH9RGLPVK1X3y4X3h
 FXZI9kVBP9JbBUS/KbEUpyRaKjFXFScCABhWAmZwQMAAA==
X-Env-Sender: dietmar.hahn@ts.fujitsu.com
X-Msg-Ref: server-3.tower-265.messagelabs.com!1572345979!331322!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18120 invoked from network); 29 Oct 2019 10:46:19 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-3.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Oct 2019 10:46:19 -0000
Received: from sanpedro.mch.fsc.net ([172.17.20.6])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id x9TAkIQa011521;
 Tue, 29 Oct 2019 10:46:18 GMT
Received: from amur.mch.fsc.net (unknown [10.172.102.12])
 by sanpedro.mch.fsc.net (Postfix) with ESMTP id BB14D569E066;
 Tue, 29 Oct 2019 11:46:10 +0100 (CET)
From: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 29 Oct 2019 11:46:10 +0100
Message-ID: <2898026.oPHHLnqm1a@amur.mch.fsc.net>
In-Reply-To: <D5940155-716B-48BE-A00B-36FC0B5B41A9@amazon.com>
References: <D5940155-716B-48BE-A00B-36FC0B5B41A9@amazon.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [stable-4.11] Heads-up: c719519 (x86/SMP: don't try
 to stop already stopped CPUs) causes 100% kexec/kdump failure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Durrant, Paul" <pdurrant@amazon.com>, "Stonehouse,
 Robert" <rjstone@amazon.co.uk>, "Elnikety, Eslam" <elnikety@amazon.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============8295406896495270805=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.

--===============8295406896495270805==
Content-Type: multipart/alternative; boundary="nextPart5538791.lYZ8q3bBHN"
Content-Transfer-Encoding: 7Bit

This is a multi-part message in MIME format.

--nextPart5538791.lYZ8q3bBHN
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Am Montag, 28. Oktober 2019, 18:30:12 CET schrieb Stonehouse, Robert:
> This is a heads-up as I have observed that the following commit (backported onto an Amazon 4.11 tree) causes kexec (and hence kdump) to fail. 
> ========
> commit c719519a4183d0630121f6abeba420f49dbc3229
> Author: Jan Beulich <jbeulich@suse.com>
> AuthorDate: Fri Jul 5 10:32:41 2019 +0200
> Commit: Jan Beulich <jbeulich@suse.com>
> CommitDate: Fri Jul 5 10:32:41 2019 +0200
> 
> x86/SMP: don't try to stop already stopped CPUs
>     
>     In particular with an enabled IOMMU (but not really limited to this
>     case), trying to invoke fixup_irqs() after having already done
>     disable_IO_APIC() -> clear_IO_APIC() is a rather bad idea:
> ========
> 
> The test was performing "echo c > /proc/sysrq-trigger" in dom0 and the loaded crash kernel fails to show any signs of starting. This is the end of the Xen console ...
> ========
> (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
> (XEN) Resetting with ACPI MEMORY or I/O RESET_REG.
> <machine hangs here then reboots via the BIOS after 5 seconds>
> ========
> Expected behaviour is that the kdump kernel immediately loads and then performs the crash dump

I can confirm this behavior but with xen version (4.11.0_08-1) from
SuSE SLES12 SP4 which doesn't contain the said commit
c719519a4183d0630121f6abeba420f49dbc3229.But I can see this only on systems with newer Intel CPUS like
"Intel(R) Xeon(R) Gold 6242 CPU".



> 
> I'm sorry that I have not yet had time to check if this affects vanilla stable-4.11 or master. I just wanted to be certain that you don't have the same issue.
> 
> 
> Reverting one hunk via the following commit fixes things for me (this is an experiment and not at all a proposed fix)
> ========
> --- a/xen/arch/x86/smp.c
> +++ b/xen/arch/x86/smp.c
> @@ -303,15 +303,15 @@ static void stop_this_cpu(void *dummy)
>  void smp_send_stop(void)
>  {
>      unsigned int cpu = smp_processor_id();
> +    
> +    local_irq_disable();
> +    fixup_irqs(cpumask_of(cpu), 0);
> +    local_irq_enable();
>  
>      if ( num_online_cpus() > 1 )
>      {
>          int timeout = 10;
>  
> -        local_irq_disable();
> -        fixup_irqs(cpumask_of(cpu), 0);
> -        local_irq_enable();
> -
>          smp_call_function(stop_this_cpu, NULL, 0);
>  
>          /* Wait 10ms for all other CPUs to go offline. */
> ========
> 
> Regards
> Rob
> 
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel


--nextPart5538791.lYZ8q3bBHN
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'Hack'; font-size:9pt; font-weight:400; font-style:normal;">
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Hi,</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">Am Montag, 28. Oktober 2019, 18:30:12 CET schrieb Stonehouse, Robert:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; This is a heads-up as I have observed that the following commit (backported onto an Amazon 4.11 tree) causes kexec (and hence kdump) to fail. </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; ========</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; commit c719519a4183d0630121f6abeba420f49dbc3229</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Author: Jan Beulich &lt;jbeulich@suse.com&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; AuthorDate: Fri Jul 5 10:32:41 2019 +0200</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Commit: Jan Beulich &lt;jbeulich@suse.com&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; CommitDate: Fri Jul 5 10:32:41 2019 +0200</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; x86/SMP: don't try to stop already stopped CPUs</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;     </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;     In particular with an enabled IOMMU (but not really limited to this</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;     case), trying to invoke fixup_irqs() after having already done</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;     disable_IO_APIC() -&gt; clear_IO_APIC() is a rather bad idea:</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; ========</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; The test was performing &quot;echo c &gt; /proc/sysrq-trigger&quot; in dom0 and the loaded crash kernel fails to show any signs of starting. This is the end of the Xen console ...</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; ========</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; (XEN) Resetting with ACPI MEMORY or I/O RESET_REG.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; &lt;machine hangs here then reboots via the BIOS after 5 seconds&gt;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; ========</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Expected behaviour is that the kdump kernel immediately loads and then performs the crash dump</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">I can confirm this behavior but with xen version (<span style=" font-family:'monospace'; color:#000000; background-color:#ffffff;">4.11.0_08-1) </span><span style=" font-family:'monospace';">from</span></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'monospace';">SuSE SLES12 SP4 which doesn't contain the said commit</span></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'monospace';">c719519a4183d0630121f6abeba420f49dbc3229.<br />But I can see this only on systems with newer Intel CPUS like</span></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'monospace'; color:#000000; background-color:#ffffff;">&quot;Intel(R) Xeon(R) Gold 6242 CPU&quot;.</span></p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=" font-family:'monospace';"><br />Dietmar.</span></p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; I'm sorry that I have not yet had time to check if this affects vanilla stable-4.11 or master. I just wanted to be certain that you don't have the same issue.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Reverting one hunk via the following commit fixes things for me (this is an experiment and not at all a proposed fix)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; ========</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; --- a/xen/arch/x86/smp.c</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; +++ b/xen/arch/x86/smp.c</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; @@ -303,15 +303,15 @@ static void stop_this_cpu(void *dummy)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  void smp_send_stop(void)</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  {</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;      unsigned int cpu = smp_processor_id();</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; +    </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; +    local_irq_disable();</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; +    fixup_irqs(cpumask_of(cpu), 0);</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; +    local_irq_enable();</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;      if ( num_online_cpus() &gt; 1 )</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;      {</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;          int timeout = 10;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; -        local_irq_disable();</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; -        fixup_irqs(cpumask_of(cpu), 0);</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; -        local_irq_enable();</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; -</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;          smp_call_function(stop_this_cpu, NULL, 0);</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;  </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt;          /* Wait 10ms for all other CPUs to go offline. */</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; ========</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Regards</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Rob</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; _______________________________________________</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Xen-devel mailing list</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; Xen-devel@lists.xenproject.org</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; https://lists.xenproject.org/mailman/listinfo/xen-devel</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p></body></html>
--nextPart5538791.lYZ8q3bBHN--





--===============8295406896495270805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8295406896495270805==--




