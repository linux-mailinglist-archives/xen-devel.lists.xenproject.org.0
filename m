Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4875B35E31E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 17:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109959.209883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWLF6-0000PM-2O; Tue, 13 Apr 2021 15:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109959.209883; Tue, 13 Apr 2021 15:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWLF5-0000Ox-VS; Tue, 13 Apr 2021 15:46:19 +0000
Received: by outflank-mailman (input) for mailman id 109959;
 Tue, 13 Apr 2021 15:46:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HRIN=JK=goodmis.org=rostedt@kernel.org>)
 id 1lWLF4-0000Os-3d
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 15:46:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a96da6a-cb8f-4aaa-8f9e-8552fe8fa839;
 Tue, 13 Apr 2021 15:46:17 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B82E61353;
 Tue, 13 Apr 2021 15:46:16 +0000 (UTC)
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
X-Inumbo-ID: 5a96da6a-cb8f-4aaa-8f9e-8552fe8fa839
Date: Tue, 13 Apr 2021 11:46:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Giuseppe Eletto <giuseppe.eletto@edu.unito.it>
Cc: linux-trace-devel@vger.kernel.org, xen-devel@lists.xenproject.org, Dario
 Faggioli <dfaggioli@suse.com>, Enrico Bini <enrico.bini@unito.it>
Subject: Re: A KernelShark plugin for Xen traces analysis
Message-ID: <20210413114614.4971caff@gandalf.local.home>
In-Reply-To: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
References: <CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi Giuseppe,

On Tue, 13 Apr 2021 16:28:36 +0200
Giuseppe Eletto <giuseppe.eletto@edu.unito.it> wrote:

> Hello,
> I want to share with you a new plugin developed by me, under the
> supervision of Dario Faggioli, which allows the new version of KernelShark
> (the v2-beta) to open and view the Xen traces created using the "xentrace" tool.
> 
> In fact, KernelShark is a well known tool for graphical visualization
> Linux kernel traces, obtained via "ftrace" and "trace-cmd". Anyway thanks
> to its modular architecture, it is now possible to implement plugins which
> open and display traces with arbitrary format, for example, as in in
> this case, traces of the Xen hypervisor.

I'm guessing you have trace events coming from Xen itself?


> 
> For more information on how to build the plugin and/or
> to view the source code I leave the repository below:
> https://github.com/giuseppe998e/kernelshark-xentrace-plugin
> 
> 
> In short:
> 
> $ sudo apt install git build-essential libjson-c-dev
> $ git clone --recurse-submodules
> https://github.com/giuseppe998e/kernelshark-xentrace-plugin.git
> $ cd kernelshark-xentrace-plugin/
> $ make
> 
> $ export XEN_CPUHZ=3G # Sets the CPU frequency ((G)hz/(M)hz/(K)hz/hz)
> $ kernelshark -p out/ks-xentrace.so trace.xen
> 
> 
> You will need the development version of KernelShark, available here:
> https://git.kernel.org/pub/scm/utils/trace-cmd/kernel-shark.git

This will soon be the main repository, as we are going to deprecate the
version in the trace-cmd.git repo soon. And because libtracecmd 1.0 has
already been released.


> 
> A screenshot of the plugin in action is available here:
> https://github.com/giuseppe998e/kernelshark-xentrace-plugin/raw/master/.github/img/ks-xentrace.png
> 
> I'm happy to receive whatever feedback you may have about it,
> and to answer any question.
> 

Thanks for doing this. What would be nice is to have the xen traces along
side the linux tracing. Perhaps we can update trace-cmd agent to work with
Xen as well. Does xen implement vsock or some other way to communicate
between the guests and the Dom0 kernel? If not, we should add one. The you
could do the following:

 1. On each guest, run as root: trace-cmd agent --xen
 2. On Dom0 run: trace-cmd record -e (events on Dom0) \
     --xen (commands to do tracing in Xen HV) \
     -A <guest-name1> -e (events on guest)

And then you would get a trace.dat file for Dom0 and the guest, and also
have a trace file for Xen (however that is done). And then on KernelShark,
we have a KVM plugin in development that does this. But you can do the same
with Xen.

For KVM, we have:

 1. On each guest: trace-cmd agent
 2. On the host: trace-cmd record -e kvm -e sched -e irq \
      -A guest-name -e all
    The above produces trace.dat for the host trace, and 
     trace-<guest-name>.dat for the guest.
 3. kernelshark trace.dat -a trace-Fedora21.dat

(I have a guest called Fedora21).

  http://rostedt.org/private/kernelshark-kvm.png

Where you can see the kvm hypervisor task KVM-2356 is the host task running
the guest VCPU 0, and you see the switch between the two.

Perhaps we can do something like that with Xen as well. The plugin is still
in the works, but should be published soon. And when it is, you could use
that as a template for Xen.

-- Steve

