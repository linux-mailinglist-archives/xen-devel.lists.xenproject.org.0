Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D79A5592A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 22:55:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904053.1311957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJBC-0005Sb-Sm; Thu, 06 Mar 2025 21:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904053.1311957; Thu, 06 Mar 2025 21:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJBC-0005Qd-PQ; Thu, 06 Mar 2025 21:54:58 +0000
Received: by outflank-mailman (input) for mailman id 904053;
 Thu, 06 Mar 2025 21:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wead=VZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqJBB-0005QX-Af
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 21:54:57 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1129cae-fad5-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 22:54:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C3117A439A2;
 Thu,  6 Mar 2025 21:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498DDC4CEE5;
 Thu,  6 Mar 2025 21:54:49 +0000 (UTC)
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
X-Inumbo-ID: a1129cae-fad5-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741298090;
	bh=FvaRyoUiQiSSX2z7zS/W5T6Th1UUzFZ2jc6uDYOMC7A=;
	h=Date:From:To:cc:Subject:From;
	b=sQt1MbXtkr/6/V9/EqcF9h8LAHCicC2lzsJp8RscQND3kiM05nLpGkyK9PM3NVfJr
	 Xl2yiTJ9XQ1kmhnxiV6hlwKZRZbw4FvWR78aY0jkzu2aSfXmAdFTKc8prQ3uhss5dF
	 dGHmFWPN/rf+Ltry4Gswl7zu1BgjoERBwh6VmPCcoWHjYsnmgABw/FOA3H7Mw6/9/h
	 6WaYOjtpYaTHg+k1P8FAZpbfFe38scGajsHb4FtMgI/oFEn3wBD9sBuqRBD8kq4cAL
	 qX0J6MaL92nwul5zoOFpf19N2FqqwO52aDRfPxxMgtE9Hbzs5OTePUKeLsr05TmPKD
	 pUCWRVDCOXVVA==
Date: Thu, 6 Mar 2025 13:54:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    marco.demi@resiltech.com, andrew.cooper3@citrix.com, 
    "Lira, Victor M" <VictorM.Lira@amd.com>
Subject: [PATCH] docs: hardware runners setup
Message-ID: <alpine.DEB.2.22.394.2503061354430.1303386@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Document how to setup a new hardware runner

Signed-off-by: Victor Lira <VictorM.Lira@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/docs/misc/ci.rst b/docs/misc/ci.rst
index 7aee55c5d2..ef3f183153 100644
--- a/docs/misc/ci.rst
+++ b/docs/misc/ci.rst
@@ -19,6 +19,49 @@ After getting access to relevant runners, few extra changes are necessary in set
 2. Expand "Variables" section and add ``QUBES_JOBS=true`` variable for Qubes runners.
 3. Go to Settings -> Repository, expand "Branch rules" section and add a rule for protected branches - only those branches will get tests on the hardware runners. It's okay to use a pattern for branch name, and it's okay to allow force push.
 
+How to Set Up a New Hardware Runner
+***********************************
+
+A hardware runner is a GitLab runner designed to execute Xen tests on real hardware, such as an embedded board or a laptop. The GitLab runner runs on a controller PC, which is connected to the target board used for Xen testing. The controller PC can be any system, from a workstation to a Raspberry Pi.
+
+Steps to Set Up the Controller PC:
+
+1. Install the Docker service
+   - Follow the instructions at: [Docker Installation Guide](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
+
+2. Install the GitLab Runner service
+   - Follow the instructions at: [GitLab Runner Installation Guide](https://docs.gitlab.com/runner/install/linux-repository/#install-gitlab-runner)
+
+3. Register the runner with GitLab
+   - Generate a runner token with a specific tag to identify it.
+   - Run `gitlab-runner register` and enter the token. Accepting the default settings is sufficient.
+
+These steps are common for setting up any GitLab runner. However, for hardware runners, additional configurations are required to enable the controller PC to:
+
+- Power on and off the target board.
+- Connect to the serial interface of the target board.
+- Establish an Ethernet connection with the target board.
+- Run a TFTP server with a TFTP root directory accessible by GitLab container tests.
+  - This allows the test script to place binaries, such as Xen, in the TFTP root before powering on the target board.
+
+To enable the required capabilities, edit the GitLab Runner configuration file located at `/etc/gitlab-runner/config.toml`:
+
+- Map the TFTP boot directory.
+- Map the serial device of the target board.
+
+Example Configuration:
+
+    volumes = ["/scratch/gitlab-runner:/scratch/gitlab-runner"]
+    devices = ["/dev/ttyUSB0:/dev/ttyUSB0"]
+
+After making these changes, restart the GitLab Runner service:
+
+    gitlab-runner restart
+
+This completes the setup of the hardware runner. The system is now ready for executing Xen tests on real hardware. As an example, to execute tests on an AMD x86 embedded board, we currently use the following script:
+
+    automation/scripts/xilinx-smoke-dom0-x86_64.sh
+
 Selecting individual tests
 **************************
 

