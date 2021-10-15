Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE7F42EC70
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 10:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209930.366520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIf2-0007YJ-U7; Fri, 15 Oct 2021 08:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209930.366520; Fri, 15 Oct 2021 08:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIf2-0007WQ-QG; Fri, 15 Oct 2021 08:33:52 +0000
Received: by outflank-mailman (input) for mailman id 209930;
 Fri, 15 Oct 2021 08:33:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UM5E=PD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mbIf0-0007WK-PM
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 08:33:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f370f1f1-d5bd-4cf1-9d0a-393a60039f3a;
 Fri, 15 Oct 2021 08:33:48 +0000 (UTC)
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
X-Inumbo-ID: f370f1f1-d5bd-4cf1-9d0a-393a60039f3a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634286828;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eA4VPJlqf2r+B6/UrDf2aD9m7XenpRSy47re9JtrLXc=;
  b=U/jwxmc4EVy+UPR2wJNQuB3naEJ8Bb1SkQPU3aP7RoEvTvLn4VXLHY8N
   Zj65c23uE6ov08tvObodul1MbYHl8tBycoMtK+4e3t9Cr7CEuzGmYlV94
   /O4yrIos7PdGecv5cfjHkr9bpVDEd8yMa/AUWlUwUOQ7XFgP50Tyl1SnE
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: H4RSizQZgWZp3d0Bh1zjpLMEzBOhfKVchZUjIcOX+rakuZv2YWYrKNfjLZXzJ3r6YoUGQQXAGF
 jl7iGt1a21X2ElS/OsrqLIJmB4wpjZ1ZU5j3yOaZ6aTeIgyv0ZRcW+tKL0xWuA418aEmTsC1VG
 dU6JAjKj6QMiiWc5IJPaXNhq1b/EZlMc0zRT4lzZ7wETsCQ8CsKvNsas2f69Eb4hObDN7iFKLa
 4KQthyFh5mvSqoVHKNMI/zyr6WMFocKKJCewAK0//xhBkGPPdJ1qs40a8MDDEm7a48iZSUWcVI
 UgaUnlfm4mcNaGc90J6SmYLv
X-SBRS: 5.1
X-MesageID: 57154802
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DioBL64OJWPxoU/W2WgQUwxRtEnBchMFZxGqfqrLsTDasY5as4F+v
 mMXWG3SOK6MMGryedh+boi0oxgFupaEzYdkHgNsrnhgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrdh29Mw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 uoQsr+RUBwSHYaUgPgWeTBUKR9ZBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWhp25weRay2i
 8wxUTc3UxvuRy92OkYoJIo+jsyio3X1WmgNwL6SjfVuuDWCpOBr65DTN97Sds2PVN9itE+Sr
 WLb/Ez0GhgfcteYzFKt8G+oh+LJtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684mamUs9bA
 1wZ/Gwpt6da3FOvZsnwWVu/unHslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC3
 FKTg8ngAzAptbSPUG+c7Z+dtzb0Mi8QRUcDei0sXQYD+8Pkoow4klTIVNkLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1UrOgy+o4IPISAE1zgzNWySu6QYRWWK+T9X2sx6Bt68GddvHCAna1
 JQZpySAxMYxUJautTWWe8YmRKm17NysPAfipmc6SvHN6A+R03KkeIlR5hR3K0FoLtsIdFfVX
 aPDhe9CzMQMZCXyPMebd6r0Up5wlfGxSrwJQ9iNNoIWCqWdYjNr682HiaS45GvqjFQ32Z82P
 ZOWYK5A5l5LVPw5klJaqwobuILHJxzSJ0uPGvgXLDz9iNJygUJ5r59ebTNiichjvcu5TP39q
 Yo3Cidz40w3vBfCSifW65UPClsBMGI2A5v7w+QOKLXfeFE8Qzx4W6WPqV/ER2CDt/8I/gsv1
 irlMnK0NXKl3SGXQel0QiELhEzTsWZX8itgYH1E0aeA0Hk/e4e/hJrzhLNsFYTLANdLlKYuJ
 9FcIp3oKq0WFlzvpmRMBbGg/dcKXEn62mqz09+NPWFXk2hIHFeSpLcJv2LHqUEzM8ZAnZBg/
 uP6j1iFHMNrqsYLJJ++Vc9DBmiZ5BA1sOlzQ1HJMp9UfkDt+5JtMCv/krk8JMRkFPkJ7mLGv
 +pPKRtH9+TLvaEv99zF2fKNo4uzSrMsFUtGBWjLq72xMHCCrGakxIZBVseOfCzcCzyoqPnzO
 70NwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 xvXqNlXMLmEIu3/F1sVKFZ3Z+iPz6hMyDLT8e40MAPx4youpOiLVkBbPh+tji1BLeQqbNN5k
 Ll54MNPsl6xkBsnNNqCnxt4zWXUIyxSSbgju7EbHJTv1lghxGZdbMGOESTx+pyONYlBaxF4P
 j+OiaPerL1A3U6eIWErHH3A0OcB15QDvBdGkA0LK1iTw4eXg/Y22Fta8CgtTxQTxRJCirohN
 m9uPkxzBKOP4zY325QTAzHyQ1lMVE+D50j861oVj2mIHUCnW1vEIHA5JevQrlsS9HhRf2QD8
 byVoIo/ve0GoC0lMvMOZHNY
IronPort-HdrOrdr: A9a23:k/eBDa7wr7205T1FiQPXwUiBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhIE3Jmbi7WJVoMkmsjqKdgLNhdotKMzOW3FdAQLsN0WKm+UyYJ8SczJ8W6U
 4DSdkYNDSYNzET4anHCUuDYrAdKbK8gcOVbJLlvhJQpHZRGsNdBmlCazqzIwlTfk1rFJA5HJ
 2T6o5svDy7Y0kaacy9Gz0sQ/XDj8ejruOrXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3C4Lm5uf3T8G6S64aT1eUZpDLS8KoCOCW+sLlXFtwqsHfrWG1VYczCgNnympDr1L9lqq
 iJn/5qBbUI15qYRBDJnfKq4Xis7N9m0Q6f9XaIxXTkusD3XzQ8Fo5Igp9YaALQ7w46sMh7y7
 8j5RPui3N7N2K1oM3G3am+a/iqrDvFnVMy1eoIy3BPW4oXb7Fc6YQZ4UNOCZ8FWCb38pouHu
 ViBNzVoK8+SyLTU1nJ+m10hNC8VHU6GRmLBkAEp8yOyjBT2HR01VERysATlmoJsJg9V55H7e
 LZNbkArsAGcuYGKaZmQOsRS8q+DWLABRrKLWKJOFziULoKPnrcwqSHlYndJNvaCqDg4KFC5q
 gpYWkoxlLaIXiedvFm9Kc7gyzwfA==
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="57154802"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVDOaaxYvq4RzaMi/W+or75TD0/GN3cHCa1boalJ3iutaki7n7+QCwL+3Lza+qjCZRnzUCrWQdHqhEiwPU3RXwBLN1PsmeobOO2ivCM/qWV1z/4pzvKO+7EljN0gQvbcSNdtHujxnuesYJBDb3PH9gAX+rxJPZqUV1lcm3qVOOTWEyusatuRy96F2Wbutpn/MT21sQD3TO9mbkSgB8qZmTNu9oiDba6KVM/jz6Hl5ac3pHBqiXKobf84PJsDBlQNtBRlzQdSYvNMBvyqEZNqdfEw976RoziNqanZlA2Bd9lzspVln2TX8H+OBE/++HXOvjo7aP8W3qLvcvz5b66kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAuRfnc1G5Fbz2J4zxeYdGa46ophWsjCLeuvL5kxp4c=;
 b=jnV6joemXM0yTkqQVVdU5OUZvA6+I98tW+Yh1Y36QLAs+l/MnsSbiAPgzusdTGUJs16X+f8u3TZlvvU6ETK1tXt9FmBH6TdUR3hJQxBTXa4+/x9d0MwPg5DGb1xTZpSa8JMuiEl22GjDSmhTbZmQ7197kZ8A4da7tlij0/Ixoi5TPg8JlrXAX8j0PLUVyzT9dHYJC5tEKlwQKtna4YnotZXzFMeAOLnE4l7KlCpk80U231LfIyjitbiPXNBr4UhYXOtCM6bQON0+NjJqa4g3K2t0dwK3vy0ltmwPkQKLJMw81mtuuJLDs9/0GL7+di20/PpjrQkV44x8dXBPEWRE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAuRfnc1G5Fbz2J4zxeYdGa46ophWsjCLeuvL5kxp4c=;
 b=OlO94h5emSIHa7fX7nLDWqMYGu+Ej75l8GvDY8Ae3LTtwKyzIkGsgKDTcEGheUqk7sT8jIjlJ3nC9x5JBwkR9FhR7RT2SBK6FGyonr7zV704ZzZCC0MEqG9GJBW7LJJczZ1lGvO9LCCwmKPZQy7wEnSyX/ifubeuikFjZSCzO/k=
Date: Fri, 15 Oct 2021 10:32:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, Rahul Singh
	<rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Message-ID: <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
X-ClientProxiedBy: LO2P265CA0244.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e78f1775-cacb-4ab2-6581-08d98fb666a3
X-MS-TrafficTypeDiagnostic: DM6PR03MB3740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3740C9A0717A20160C7E5C6F8FB99@DM6PR03MB3740.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrM6y3ceSzRsfmRcuS2/gpmYifUHn+ypYzLWczzfgp/oiUELfBhuOgYPzeFl9rYLXd+0gLNeOnRkPf+Og16OQoDAPAl42dAmj1WY0iFjFKQTlkC4r33bQtB1lsFaNzsM69k8oOxAlen6PxxjZV8lSdsVXnucJ2ZzkIQ9LiPWPpYHxRodR2E7dgOG0fY6LVtz8lj7qN0+5J0lvGzFe7Pa2tToaWtujj72ONxPBbdYbINdYLrUyJ50ufCyte254rxwgDyt9RjWJS7qBR0g+yHOBJFlj1LlPpxpQCbPlk1V9zZbWMn8D/Dv3ez+3MdW3LUCQ/s/JLOO9sOJZJEilVyKD+jc3BJ7JU1v+KGvUHn9s3AGOIK7kchIBT+clzjN6Fm9BTaraUlB3utSrmb/drJN5z+O7pNgCM1vHGAxK5I/TGAj9dfIMyx8DRz5H5rczRBVoJ21IdumXMZCJ/b5OowmFmafNdfbZ+xIx/G2W5V1rBlTnIcerl+Z/ftWXOTtTk5fXW9eG/hVs1qExtYs3jBBa4hVWfsUIaLkp5ldjmVZE6972qNuoHH3zwAb4Aw7JkdtA6tCvfBbwx79r1/c15IeghXlzerOSs9Hg6B8vuE8Rl3fTf+zCo3zZe3rmyOBr28yRMPPzwpY+/S3C4VVIb1qQMMP75fZ6Fir8MMgdHPjQ5mjuZwO6VKh9jMVC9I5yvFi3HcZ33ics8YjSuDCkF4E5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2906002)(66556008)(956004)(66476007)(6666004)(26005)(6486002)(4326008)(9686003)(86362001)(8676002)(38100700002)(6916009)(6496006)(316002)(66946007)(85182001)(30864003)(508600001)(83380400001)(8936002)(54906003)(7416002)(186003)(82960400001)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0NMUnNadjYvZnlQWGdOMlZVMzJwVEowUU1rdUhDQjZzU3plWnEwMnY1ZGtH?=
 =?utf-8?B?d1dNU2lDYWMzSWo2eUJ3NTV6amV0NkcrSHIveVpSeTJtM1R3R1JFVng1MENK?=
 =?utf-8?B?VEVZQ2lEbXEzeUI1YXJnYkZCcjlZUENCWitaZzZxZlYrajZTUDdrR2tPekk0?=
 =?utf-8?B?bWtpM0tYT3EvM2RRV0JTUDhCUWlickRUTEVnaHM0WFNxVTlEN3YvWkpBNzZP?=
 =?utf-8?B?YlJwdnVjZmlKTWxIRWhhWmExOG4wNlJvVW11emppazFYY0Z2WDdXVnhiOFFp?=
 =?utf-8?B?Si83VENJNW5PZ0lKeEFYaVpuQ2FydkU5SFoxaXhCQmlqUGN3UlIzNit1UXUz?=
 =?utf-8?B?QnJ4bnhXWEZzK1ZIaTE4Z0NNWE15WHMraUVmSllidkp0WWNkU2VodTVLaTg4?=
 =?utf-8?B?QndBWXpqRGp0ZVJpRWY1OXNxbWoxZ1NWay9ObnczM3A1WEI1SlY4S1BoMmhM?=
 =?utf-8?B?ODc3LzJ3VUREdSs2Q1BWVTlkZFZkVThXVGV0a1VrblFmV0pTRlhxVklvOVE4?=
 =?utf-8?B?Yk05S01xaUo1V3JRS21iMmM4a09rdlE2QTJXdklab1d4MDNVZk1nc3BEL21G?=
 =?utf-8?B?d0RNN1pJMUVJaFIwcVhSU3lPMnNLd2JmT2M3MWpqTk42NWFzMmZ0b2habDZq?=
 =?utf-8?B?RUNQVG03SHBLV2JraTA0NGh6WEl0MXhDWWdINk1GWmg5R2xUelE2TTl5QXJi?=
 =?utf-8?B?N0hWeXNEMmZ5RVhGOCtCYWJnMUZ2S3lkVUVlb2pXa0d1WVo4NmE4Sm0xejRS?=
 =?utf-8?B?UnVMSkwyYmRkTFJQMnUzTmJneGlvY2lFYXVraE9kQ09IdElhMHpad3ZXUHpT?=
 =?utf-8?B?TFRTbnBnT3hKV3RpWkxMdktpeG5JV3pROFNlc25ZQlkrbXNLa3ZMZWRpR2NO?=
 =?utf-8?B?NkFwM0JOL2R6cWhqby9UQkE1VTlBWnovUzNwNXMvR284R2tLenFXWmxoampV?=
 =?utf-8?B?cEMwYUswNG53bHRwQnpZNVNWT28vaVUxMWJjSEUxWlBQbUdrYTlhTzYvWWJp?=
 =?utf-8?B?c2xVRytkcHAza1RsL0o0SllKUUtkRUpQQVZ3ZFZVZ0RYK1lXcnY3ZnoyTElv?=
 =?utf-8?B?WERWbi9OVk5kUDBlNWx6VDRhMDBTRzhiYisra1p6TDVsY0U0eUpzZ3Vva0Fx?=
 =?utf-8?B?ZWRKdjY2bkZSdlpnVUlaeVBya1ZKd2wxclZLSFhmTFNTTXlONjVUNGVUakJ4?=
 =?utf-8?B?dlBoa3lIZ25uanpXdWtpUyt0YkNTWFZsZXNKNXpSRkN3ZTVSWGVHd1REbnEr?=
 =?utf-8?B?Q1diSUIxWGgrNHpsTjJIaWlPOTFLL1IwWjZEWXNtSjNRUEFscG5ac3RIUjRu?=
 =?utf-8?B?RWdRb2ZqZUhwYnh0WkwwWTBRZlM0OTNzS1IrYmxvT3dxTlErMlh6QmQxZk9I?=
 =?utf-8?B?T2UyYmpVclB3cnJzZjlPVmxPd2RqSEU2Qk0vWnBjQmNzeHFZQmN1ZzdPN2Ni?=
 =?utf-8?B?SmlJWDU1WGF5Q0tDcHAwc3BXNnRyRE9TVUsrUmpGa205M1ErLzZrWVZiYndW?=
 =?utf-8?B?bDEzc1drK3lBcG5rL0Eyc1pjall1UWt1VGRybzZCQmptT0NPYU9HQTVTSHk1?=
 =?utf-8?B?SUpMYnc3MWs1NFNPcWVSRWVWMGtXdHNTdlp1cEJweHI4eUQyTW44TkdQMnZ1?=
 =?utf-8?B?dUZJREtXTnNVMmdDTzhMbkJBWmJ6YnM5Q3lSWVVUemFSbjN6YUZlRU9zN3Z0?=
 =?utf-8?B?VHpKaHJPeWNpZFVmV2hmMlVhWGVOY1ZuOUROMlR0YXVmT29sRTNpcEI2OVhp?=
 =?utf-8?Q?oprEGhGkV691kOmkfiht8yojCkgI58pj5WF/C8F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e78f1775-cacb-4ab2-6581-08d98fb666a3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:33:01.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMaj+6eCZayIb68zzRgItoEbmy4SOz1+09mjGiJFqSEnq2aD8DYvBCwVyUaPKyF3wesm5EbUIKzZMCgWHKR9oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3740
X-OriginatorOrg: citrix.com

On Thu, Oct 14, 2021 at 03:49:50PM +0100, Bertrand Marquis wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> The existing VPCI support available for X86 is adapted for Arm.
> When the device is added to XEN via the hyper call
> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space
> access is added to the Xen to emulate the PCI devices config space.
> 
> A MMIO trap handler for the PCI ECAM space is registered in XEN
> so that when guest is trying to access the PCI config space,XEN
> will trap the access and emulate read/write using the VPCI and
> not the real PCI hardware.
> 
> For Dom0less systems scan_pci_devices() would be used to discover the
> PCI device in XEN and VPCI handler will be added during XEN boots.
> 
> This patch is also doing some small fixes to fix compilation errors on
> arm32 of vpci:
> - add a cast to unsigned long in print in header.c
> - add a cast to uint64_t in vpci_ecam_mmio_write
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v6:
> - Use new vpci_ecam_ helpers for PCI access
> - Do not set XEN_DOMCTL_CDF_vpci for dom0 for now (will be done in a
> future patch once everything is ready)

Isn't the series missing a revert of XEN_DOMCTL_CDF_vpci? I think
that's what we agreed would be the way forward.

> - rename REGISTER_OFFSET to ECAM_REG_OFFSET and move it to pci.h
> - remove not needed local variables in vpci_mmio_write, the one in read
> has been kept to ensure proper compilation on arm32
> - move call to vpci_add_handlers before iommu init to simplify exit path
> - move call to pci_cleanup_msi in the out section of pci_add_device if
> pdev is not NULL and on error
> - initialize pdev to NULL to handle properly exit path call of
> pci_cleanup_msi
> - keep has_vpci to return false for now as CFG_vpci has been removed.
> Added a comment on top of the definition.
> - fix compilation errors on arm32 (print in header.c, cast missing in
> mmio_write.
> - local variable was kept in vpci_mmio_read on arm to prevent a cast
> error in arm32.
> Change in v5:
> - Add pci_cleanup_msi(pdev) incleanup part.
> - Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Change in v4:
> - Move addition of XEN_DOMCTL_CDF_vpci flag to separate patch
> Change in v3:
> - Use is_pci_passthrough_enabled() in place of pci_passthrough_enabled variable
> - Reject XEN_DOMCTL_CDF_vpci for x86 in arch_sanitise_domain_config()
> - Remove IS_ENABLED(CONFIG_HAS_VPCI) from has_vpci()
> Change in v2:
> - Add new XEN_DOMCTL_CDF_vpci flag
> - modify has_vpci() to include XEN_DOMCTL_CDF_vpci
> - enable vpci support when pci-passthough option is enabled.
> ---
> ---
>  xen/arch/arm/Makefile         |  1 +
>  xen/arch/arm/domain.c         |  4 ++
>  xen/arch/arm/vpci.c           | 74 +++++++++++++++++++++++++++++++++++
>  xen/arch/arm/vpci.h           | 36 +++++++++++++++++
>  xen/drivers/passthrough/pci.c | 18 ++++++++-
>  xen/drivers/vpci/header.c     |  3 +-
>  xen/drivers/vpci/vpci.c       |  2 +-
>  xen/include/asm-arm/domain.h  |  1 +
>  xen/include/asm-x86/pci.h     |  2 -
>  xen/include/public/arch-arm.h |  7 ++++
>  xen/include/xen/pci.h         |  3 ++
>  11 files changed, 146 insertions(+), 5 deletions(-)
>  create mode 100644 xen/arch/arm/vpci.c
>  create mode 100644 xen/arch/arm/vpci.h
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 64518848b2..07f634508e 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -7,6 +7,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
>  obj-y += platforms/
>  endif
>  obj-$(CONFIG_TEE) += tee/
> +obj-$(CONFIG_HAS_VPCI) += vpci.o
>  
>  obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>  obj-y += bootfdt.init.o
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index eef0661beb..96e1b23550 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -39,6 +39,7 @@
>  #include <asm/vgic.h>
>  #include <asm/vtimer.h>
>  
> +#include "vpci.h"
>  #include "vuart.h"
>  
>  DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> @@ -773,6 +774,9 @@ int arch_domain_create(struct domain *d,
>      if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
>          goto fail;
>  
> +    if ( (rc = domain_vpci_init(d)) != 0 )
> +        goto fail;
> +
>      return 0;
>  
>  fail:
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> new file mode 100644
> index 0000000000..7c3552b65d
> --- /dev/null
> +++ b/xen/arch/arm/vpci.c
> @@ -0,0 +1,74 @@
> +/*
> + * xen/arch/arm/vpci.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#include <xen/sched.h>
> +#include <xen/vpci.h>
> +
> +#include <asm/mmio.h>
> +
> +static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
> +                          register_t *r, void *p)
> +{
> +    pci_sbdf_t sbdf;
> +    /* data is needed to prevent a pointer cast on 32bit */
> +    unsigned long data = ~0ul;
> +    int ret;
> +
> +    /* We ignore segment part and always handle segment 0 */
> +    sbdf.sbdf = ECAM_BDF(info->gpa);
> +
> +    ret = vpci_ecam_mmio_read(sbdf, ECAM_REG_OFFSET(info->gpa),
> +                              1U << info->dabt.size, &data);
> +
> +    *r = data;
> +
> +    return ret;
> +}
> +
> +static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
> +                           register_t r, void *p)
> +{
> +    pci_sbdf_t sbdf;
> +
> +    /* We ignore segment part and always handle segment 0 */
> +    sbdf.sbdf = ECAM_BDF(info->gpa);
> +
> +    return vpci_ecam_mmio_write(sbdf, ECAM_REG_OFFSET(info->gpa),
> +                                1U << info->dabt.size, r);
> +}

I'm not sure returning an error value here is helpful, as I'm not sure
how native Arm behaves and how this error is propagated into the
guest. FWIWreturning ~0 or dropping writes is what we do in x86 when
vPCI is not capable of handling the access.

> +
> +static const struct mmio_handler_ops vpci_mmio_handler = {
> +    .read  = vpci_mmio_read,
> +    .write = vpci_mmio_write,
> +};
> +
> +int domain_vpci_init(struct domain *d)
> +{
> +    if ( !has_vpci(d) )
> +        return 0;
> +
> +    register_mmio_handler(d, &vpci_mmio_handler,
> +                          GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
> +
> +    return 0;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> +
> diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
> new file mode 100644
> index 0000000000..d8a7b0e3e8
> --- /dev/null
> +++ b/xen/arch/arm/vpci.h
> @@ -0,0 +1,36 @@
> +/*
> + * xen/arch/arm/vpci.h
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __ARCH_ARM_VPCI_H__
> +#define __ARCH_ARM_VPCI_H__
> +
> +#ifdef CONFIG_HAS_VPCI
> +int domain_vpci_init(struct domain *d);
> +#else
> +static inline int domain_vpci_init(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif
> +
> +#endif /* __ARCH_ARM_VPCI_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 3aa8c3175f..8cc529ecec 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -658,7 +658,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>                     const struct pci_dev_info *info, nodeid_t node)
>  {
>      struct pci_seg *pseg;
> -    struct pci_dev *pdev;
> +    struct pci_dev *pdev = NULL;
>      unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
>      const char *pdev_type;
>      int ret;
> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>  
>      check_pdev(pdev);
>  
> +#ifdef CONFIG_ARM
> +    /*
> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
> +     * Dom0 inform XEN to add the PCI devices in XEN.
> +     */
> +    ret = vpci_add_handlers(pdev);
> +    if ( ret )
> +    {
> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> +        goto out;
> +    }
> +#endif

I think vpci_add_handlers should be called after checking that
pdev->domain is != NULL, so I would move this chunk a bit below.

> +
>      ret = 0;
>      if ( !pdev->domain )
>      {
> @@ -784,6 +797,9 @@ out:
>                     &PCI_SBDF(seg, bus, slot, func));
>          }
>      }
> +    else if ( pdev )
> +        pci_cleanup_msi(pdev);

I'm slightly lost at why you add this chunk, is this strictly related
to the patch?

>      return ret;
>  }
>  
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index f8cd55e7c0..c5b025b88b 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -374,7 +374,8 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>              gprintk(XENLOG_WARNING,
>                      "%pp: ignored BAR %lu write with memory decoding enabled\n",
> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +                    &pdev->sbdf,
> +                    (unsigned long)(bar - pdev->vpci->header.bars + hi));
>          return;
>      }
>  
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index c0853176d7..2bd67fc27a 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -507,7 +507,7 @@ int vpci_ecam_mmio_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
>  
>      vpci_write(sbdf, reg, min(4u, len), data);
>      if ( len == 8 )
> -        vpci_write(sbdf, reg + 4, 4, data >> 32);
> +        vpci_write(sbdf, reg + 4, 4, (uint64_t)data >> 32);
>  
>      return 1;
>  }
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 14e575288f..9b3647587a 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -263,6 +263,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>  
>  #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>  
> +/* vPCI is not available on Arm */
>  #define has_vpci(d)    ({ (void)(d); false; })
>  
>  #endif /* __ASM_DOMAIN_H__ */
> diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
> index a0df5c1279..443f25347d 100644
> --- a/xen/include/asm-x86/pci.h
> +++ b/xen/include/asm-x86/pci.h
> @@ -6,8 +6,6 @@
>  #define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
>  #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
>  
> -#define ECAM_BDF(addr)   ( ((addr) & 0x0ffff000) >> 12)
> -
>  #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
>                          || id == 0x01268086 || id == 0x01028086 \
>                          || id == 0x01128086 || id == 0x01228086 \
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index d46c61fca9..44be337dec 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -418,6 +418,13 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
>  #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
>  
> +/*
> + * 256 MB is reserved for VPCI configuration space based on calculation
> + * 256 buses × 32 devices × 8 functions × 4 KB = 256 MB
> + */
> +#define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
> +#define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
> +
>  /* ACPI tables physical address */
>  #define GUEST_ACPI_BASE xen_mk_ullong(0x20000000)
>  #define GUEST_ACPI_SIZE xen_mk_ullong(0x02000000)
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 70ac25345c..db18cb7639 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -40,6 +40,9 @@
>  #define PCI_SBDF3(s,b,df) \
>      ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
>  
> +#define ECAM_BDF(addr)         ( ((addr) & 0x0ffff000) >> 12)
                                   ^ extra space?

Thanks, Roger.

