Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB1F2B5F6C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 13:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28970.58128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf0VC-0007ft-5L; Tue, 17 Nov 2020 12:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28970.58128; Tue, 17 Nov 2020 12:54:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf0VC-0007fU-1o; Tue, 17 Nov 2020 12:54:30 +0000
Received: by outflank-mailman (input) for mailman id 28970;
 Tue, 17 Nov 2020 12:54:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kf0VA-0007fP-9a
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 12:54:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2edbb50c-65ce-4849-8578-31c28127995c;
 Tue, 17 Nov 2020 12:54:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rcuG=EX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kf0VA-0007fP-9a
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 12:54:28 +0000
X-Inumbo-ID: 2edbb50c-65ce-4849-8578-31c28127995c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2edbb50c-65ce-4849-8578-31c28127995c;
	Tue, 17 Nov 2020 12:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605617666;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IeWlfUqCmhy5y6xIe3S5Xjsz/LVN584qLW6yOrPaquI=;
  b=bqjlLbwS8ccLu6CeKklWVPcWnewzTSdBpFeT8FRvrq4hJjr0KyJ44G3r
   nDac8NV1iGzhNwSu8bGRTc0IQufd8g0cpIawL7i2yZrrSP92mXFjxvduv
   eB0R+bk7Ps1lFN+LzOnkOaxI5ufQEZTyqaBcanoap2gOg25Rh7WcDGRDk
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nrE2r5EcEtkkLXj95gMh3Hdq/LWZn42m+5pF0IIpTYyB3PE9i0JX5HuzYUN9PPXXtCkOEPwalf
 2IjIcJFm+5h1RIdYD08YodmWRxIz4wc6rSx/+eo+7kZ83vr/8X4cXN4c8mWdiZHQG+ia8KnAwX
 fG5yHcswe0tb5oB4UXjtCcTQtZ2DvEhtKEPAL58kMwBSXscgJNItrP6laFOAnINkuDb4vRk7D/
 RLCEMwyg+RnLy7amJUSDhY5aeoELresKHc30uIiq4LJxYTK/szR2hCNsEtEn6EiZHcHbo7a9Cb
 bco=
X-SBRS: None
X-MesageID: 31673585
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,485,1596513600"; 
   d="scan'208";a="31673585"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVGVw5rzG5/iPT/WVvu7u/3wIIGQN4UeOYWwE2cXhD3wGzB4CMYa/yYyWDIvkWbNkb2RkLKKyeZeMXmYbvDg2swyBQtdysh7RYSc5hdk+4J+YSwpgGiW1MlKIeQC8xH9P0Hj125U+4akn5Ex2FRPPw1OctbZFHCc2VVjUFBXNLh5R/H2PWbCfag+3/e8wOkFL2+7LUACfiO5Cvy9BOIUfrMtWj5d4PRI4Ct71nZMe+fzfyuovdKaqlnTQt9GDz2GRLKgHtofuy0Pe4PBNVgb9w+834OZ3QOpVcgfFyRh7i9e0KbuJJGgNlYOqNv784+7JHDpbCxcpcwowiQuKklQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNScQ2lP2jTT3efRphi/9RIgLG8rE7pQrMcbEcbruwg=;
 b=AQNdR8Im0DFfmuKcRGAJRdIqDZPITKonmEetnScTSodO+U/AiNkvI0MeZ+jcr8UhdsBvsblNRTLZp5ewCAwgLFHljOEn53AcIhrY6seDAtjMHhqb8QIcixpA8CQYp9A1PL1cu4YpcVtV0gJmPrESWC5yXEZtKbwiqgehaZx/Tf9Ti/utVJZY12DYuWkpBrQi/QuExlUl7Yr0aEbXJwKb8fT+J6DHuEDpTkr/SN/A+gYMxG3ZvBazdSrgKxjUPlW+smGjEfM1erQl9sH8BTtIYzy+u1tOWeXjZbhIniw7VbBfmTEsU2taJGmk1hPFccwAIyk858i0J91jJwGvsaYHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNScQ2lP2jTT3efRphi/9RIgLG8rE7pQrMcbEcbruwg=;
 b=hfp4D4bKzDfZ5fNpEI+mOUdE+f2WxKnz0YfUx4wZHmtgic2WiP8O4uvRFq9jgP/4yRfIreLPVtGNcO3/nI1KdYbUkOfex4mfdWu5e3cOIVIMKrXibF9eA300wOttkixNjDIWk8V042nVeUg58Sn4EZDWr7p5korTzjcVI8hOa/I=
Date: Tue, 17 Nov 2020 13:54:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Cheyenne Wills <cheyenne.wills@gmail.com>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: XSA-351 causing Solaris-11 systems to panic during boot.
Message-ID: <20201117125407.66xb3uuil3g4t6ek@Air-de-Roger>
References: <CAHpsFVc4AAm6L0rKUuV47ydOjtw7XAgFnDZxRjdCL0OHXJERDw@mail.gmail.com>
 <20201117105039.mpfrnwvojpmfaopx@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201117105039.mpfrnwvojpmfaopx@Air-de-Roger>
X-ClientProxiedBy: MRXP264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::18) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fec8937-76fa-4da5-592e-08d88af7e243
X-MS-TrafficTypeDiagnostic: SN6PR03MB4253:
X-Microsoft-Antispam-PRVS: <SN6PR03MB425326AD0BFE5DB81CBDCE378FE20@SN6PR03MB4253.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jbexlLwsCiB7uTADZfHK64ZCJHH3jW38Y26z79uj+K7MdkIjJYrD6UiHfqhnTY8AkuyW+iA09/ngT8Y+8rptnUfbDwEv/+ust3/MbCC3fvc4NOIcjC50XWPJCeZ/QEWS6uq24waCASl7XfYiQ+3UIHzb7tBXKf7+zf3/9Cyp00Fo5Udxf7izWWTd99OMP2Or/h65NjYgSPYNZhguZYZg+GYf00FxTGAW5zMQvl9V64zbfI6MY/756RUSJsLM18PMBPRLxE3a9riDpo6fqaiDQs1Ydzp76QFdKXKeQwZyZCplEwxof8JKp+sfgso9fNNO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(186003)(16526019)(85182001)(8676002)(66556008)(316002)(66476007)(6916009)(8936002)(66946007)(1076003)(2906002)(4326008)(33716001)(26005)(5660300002)(6496006)(86362001)(478600001)(9686003)(956004)(83380400001)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: r8WcWx9sh+TWQJnziSz2uRYaASTW9kgD9rjg+4SAKKin0Cb0Deh92au1Ae5044n1GjkiIc7Kin0ZuO2qe0b1yoLqcW5vinyerKWEDEq9iwSjc5ITPRujJoosKRMZIlJp+Iu4qt8DwN7b1lqZVa0W6jOev58l8f8PjhlZqL77wZ9/vPcqr+WY42qXNTWbZ0ZXb9yeI2yVH7sye6XYSfvyboThhkSaBksnoJHguzFzAQ3waE0mcqhuWLQ8sl3mtwgb2+CgmP4LTd/ijSVdXZksJU1e3Azg7Uu0zBrZkL3R5r7ix3E4B1ifBoXflLCeTcIXZrL4pPw6WipsxG6wiCjTsAxw1+lXJVWh71Qtcc2O6E1GBgu7UzalH+uPt5cMZjv5XAuqr+SCNfLXjGFcRXRL/dKc2TlY1MNqkWgbuK7gRWjl4jVsVELjFX7B+5VddnMkCFVKP3T74SeHBXz/+Skyk4Hd8Jt09taCuWsKKWnGF7oIBFP1J3WuEigDAhCVdEUwNAB4kz09nFLhhzZ/g1j7d9t9jJarZhdg6VYVpwmddOjFXXUacLwmNULGY+BdBgfdyG5RpZduwpDnd76jBet0M19QpSRWzroebml5yfI/EyOQkvufR+gxN94eMOjf9kndMcIGad1i662d5ZVeh0zdwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fec8937-76fa-4da5-592e-08d88af7e243
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 12:54:13.7096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KduIXo+14VF/muoIKs+FwNIevnAX5xHX5cdfgA4XsSpibSRDU11jCCOq5nbrIRj8Blbzfhc4cSOvy53HFeNQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4253
X-OriginatorOrg: citrix.com

On Tue, Nov 17, 2020 at 11:50:39AM +0100, Roger Pau Monné wrote:
> On Mon, Nov 16, 2020 at 02:57:14PM -0700, Cheyenne Wills wrote:
> > Running Xen with XSA-351 is causing Solaris 11 systems to panic during
> > boot.  The panic screen is showing the failure to be coming from
> > "unix:rdmsr".  The panic occurs with existing guests (booting off a disk)
> > and the  booting from an install ISO image.
> > 
> > I discussed the problem with "andyhhp__" in the "#xen" IRC channel and he
> > requested that I report it here.
> > 
> > This was failing on a Xen 4.13 and a Xen 4.14 system built via gentoo.
> > 
> > I understand that ultimately this is a bug in Solaris.  However it does
> > impact existing guests that were functional before applying the XSA-351
> > security patches.
> 
> I seem to have some issues getting the Solaris 11.4 ISO to boot, which I
> think are unrelated to the MSR changes. I get what seems to be a panic
> just after the Copyright message, but there's no reason printed at all
> about the panic. The message just reads (transcript):
> 
> SunOS Release 5.11 Version 11.4.0.15.0 64-bit
> Copyright (c) 1983, 2018, Oracle and/or it's affiliates. All right reserved.
> System would not fast reboot because:
>  newkernel not valid
>  fastreboot_onpanic is not set
>  ...
> 
> The config file I'm using is:
> 
> memory=1024
> vcpus=4
> name="solaris"
> 
> builder="hvm"
> 
> disk = [
>   'format=raw,vdev=hdc,access=ro,devtype=cdrom,target=/root/sol-11_4-text-x86.iso',
>   'format=raw,vdev=hda,access=rw,target=/root/solaris.img',
> ]
> 
> vif = [
>  'mac=00:16:3E:74:3d:88,bridge=bridge0',
> ]
> 
> vnc=1
> vnclisten="0.0.0.0"
> 
> serial='pty'
> 
> on_crash="preserve"
> 
> Is there anything I'm missing?

OK, it seems like Solaris requires more than 1GB of memory in order to
boot. I've increased it to 4GB and I've been able to boot successfully
up to the installer.

I'm however able to boot up to the installer screen without any
crashes, so I guess the version I'm using (11.4.0.15.0) is already
fixed?

Can you paste which version of Solaris you are using and if possible
where I can find the installer media to reproduce?

Thanks, Roger.

