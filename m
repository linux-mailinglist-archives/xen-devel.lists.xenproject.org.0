Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78544B0A3A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 11:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269756.463841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI6Ia-00049h-3r; Thu, 10 Feb 2022 10:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269756.463841; Thu, 10 Feb 2022 10:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI6Ia-00046i-0H; Thu, 10 Feb 2022 10:03:36 +0000
Received: by outflank-mailman (input) for mailman id 269756;
 Thu, 10 Feb 2022 10:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9Dk=SZ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nI6IY-00046c-6K
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 10:03:34 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2e28578-8a58-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 11:03:32 +0100 (CET)
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
X-Inumbo-ID: b2e28578-8a58-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644487412;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=LnAdlFNKLDAF450e79nH567TbE1Tcc1vsbzVT7HTvhE=;
  b=FQWyMNBrRk3g4DDOOalcarIuPn0rI08JlXer/hI9DUfKsK+vuS3PhJMC
   Jus71xPnnic/Pa+p2jWwW5+swkmkAYoaabafAWP8eHxMWPXFPH7tYIlTy
   t/OkjgbW10UvegeL2nG3+twLr9JV/jsNydFm+i9a9pIULUKovr9O8gF2h
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hrRUobbaazwqW8DbfFa0lawlILxQVgc/DwSF4Pr1wjmljuYURszjZPtthWUkUAP4uuoP1aRfIA
 hGYZJQoVO8AewsilUPeBO2P33gxDkuSn0upUYk1AsfhaAXFV6PPY9FgfAEEOPE86TA/9AcmVIw
 BCrTzVwJeVc+FYB1O7G+NtSbmatuYweE0VpXjfGo8oi+NWuUB4pOj67vyGkM+EZfzvcPBk1agU
 fk1/UOnXcAlma6pMUoe1a7APg2A66HPxQPrKqStFihAg3ffV/5QGHDpH9GjQH4zGU9ZaFCxr6n
 kt3Fks6Dhpfi5LmPYTAfHIiR
X-SBRS: 5.1
X-MesageID: 66130309
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kxfS8q6bDrTbxtDFQTGuPgxRtEnBchMFZxGqfqrLsTDasY5as4F+v
 jYZUWjQPqmJYWr8KYogPYiypxsCvZTUmtQ2QQpt+SwzHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Yw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 tlk7LCNayoVY4aPgqM8fRNEIxNmMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmlp3ZgVRae2i
 8wxZhxTNRLNUy92O2gwMLYxhdWlqVv4WmgNwL6SjfVuuDWCpOBr65DTN97Sds2PVN9itE+Sr
 WLb/Ez0GhgfcteYzFKt6Wmwj+XCmSf6XoM6F7Ci8PNuxlqJyQQ7AhAMSUGyp/X/j0ekQs9eM
 GQd4C9opq83nGSoQ8f8WVukoXeClh8aR9dUVeY97WmlyLfSpQCQBWEGTztIQN0gqMIyAzct0
 zehgNfBFTFp9rqPRhq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseIa3gcfyAirY2
 C2RoW41gLB7pcwW06S2+3jXjjTqoYLGJiY37AjKWmOu7itieZWoIYev7DDmAe1oddjDCAPb5
 T5dxpbYvLtm4YyxeDKlaukkRZ2Uxdu5bRafmxlOMZM9xwa19Cv2FWxP2w1WKEBsO8cCXDbmZ
 k7PpA9cjKNu0GuWgbxfONzoVZlzpUT0PZG8D62PMIISCnRkXFLfpElTiVisM3cBeaTGuYU2I
 t+lfMmlFh724ow3nWPtF4/xPVLGrx3SJF8/p7iml3xLMpLEPRZ5rIvp1nPVN4jVC4ve/m3oH
 y53bZfi9vmmeLSWjtPr2YASN0sWCnMwGIr7rcdaHsbafFY6RDp7U6eKkexwE2CAo0izvryRl
 p1achUGoGcTeFWdcVnaApydQO+HsWlDQYITYnV3YAfAN4kLaoez9qYPH6bbjpF8nNGPOcVcF
 qFfE+3ZW6wnYm2ep1w1MMmsxKQ/JU/DrV/fYEKYjM0XIscIq/rhoYS/IGMCNUAmU0KKiCfJi
 +P8iF2LG8dfL+mgZe6PAM+SI5qKlSF1sMp5XlfSI8kVf0Pp8YNwLDf2gONxKMYJQSgvDBPAv
 +pPKRtH9+TLvaEv99zF2fKNo4uzSrMsFUtGBWjLq72xMHCCrGakxIZBVseOfCzcCzyoqPnzO
 70NwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 xvXqNlXMLmEIu3/F1sVKFZ3Z+iPz6hMyDLT8e40MAPx4youpOiLVkBbPh+tji1BLeQqbNN5k
 Ll54MNPsl6xkBsnNNqCnxt4zWXUIyxSSbgju7EbHJTv1lghxGZdbMGOESTx+pyONYlBaxF4P
 j+OiaPerL1A3U6eIWErHH3A0OcB15QDvBdGkA0LK1iTw4eXg/Y22Fta8CgtTxQTxRJCirohN
 m9uPkxzBKOP4zY325QTAzHyQ1lMVE+D50j861oVj2mIHUCnW1vEIHA5JevQrlsS9HhRf2QD8
 byVoIo/ve0GoC0lMvMOZHNY
IronPort-HdrOrdr: A9a23:4jWPMam4wQ8xDj8y5H2Xw7G3pn/pDfO1imdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdeEYbmIK8/oSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYHNu/xKDwReOApP+tcKH
 LKjfA32wZINE5nJfhSQRI+Lpr+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+iemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30l0dFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNNN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wSJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABynhkjizylSKeGXLzcO9k/seDlBhiXV6UkboJlB9TpY+CRF9U1wsa7USPF/lp
 P52+pT5fVzp/QtHNJA7dE6ML+K41z2MGPx2V2pUCfa/YE8SjvwQs3Mkf0IDN/DQu188HJ1ou
 WHbG9l
X-IronPort-AV: E=Sophos;i="5.88,358,1635220800"; 
   d="scan'208";a="66130309"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpbE+pjOXBr6uI8fT7vSLh+sOVipxklR4k1k4p2Fc7VnD4A7wfPEA+BQuikoqg6DopsTlAWxE57+o+LJMnO8aCNyMHXTILkklTVEz1OOrGquawCK8xwluquxI3nsQzEZFaGSP2MeAAj8E0UOuGDn2RJdKt/fmb6xNX0LEjnvovgQ+6bvVwuRfb9c1g2nIYvubkCjDrzFbw2DMuFU+h7zWye0I7QjlXyXI2LpZlzRnyX9yy9sbS7OksxIk2szblDY8JlkJKnxfAEGzX7VP8reyzvwF/xl2/MsGhqGWT8VeHZWW/uqyktuFHQBLWhW3CXzEaaNZQpQoFTkiz5bME1aHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJb1qmxhgZ53HJ1YejXoqaBY8B52fDDlokKmhnzGshU=;
 b=bHaQQO6vNwX7AT9wmuMXD9HOynJoWlCf9mIBM1xf6wNF/gB8C3YvNW3DuxzrH0RUEM9o6y0Rm6+1iXr8xoRg7ewhx/+FqUp/KjhGJNSOxsg68LXTlEngXE4xDhqD08AA6SAt/0ZZqpSQYFNPEFDG4Xw9JAYCx/gDWpDP/p10Khg0lAL8a/Fvo2TGwb4yveYPs7Tx6r46kDuSCUzzTMYrpfKVfHjcjnm/b2aQaAt2k7A21RnlPunRApcvemdY1RY1J2LhgRTexB6xlviFJQb1vLFD7ePmHU54teQo3VYVQtsYBnwZyjwDQZQZ0+nYl48ySPEYcftLf4HeHpWwJFGc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJb1qmxhgZ53HJ1YejXoqaBY8B52fDDlokKmhnzGshU=;
 b=WMHxyZ8B6EjcVI1+4xaruYBQ2zCLn0p91VSQc9m48CTegvScM/L99PU3sBgADE3FWSSxxfahpSasunjueVp1+NOIFc8k8A5ZcY5XVHLWzMOGHqsuodJ64B/3Ct9c7W7bJFC6ZjfwUi8HDFg7yhXp6XF6rqzlbvWFr+qXv7vLh/0=
Date: Thu, 10 Feb 2022 11:03:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <YgTi6bzeojtcu0xL@Air-de-Roger>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220207182101.31941-2-jane.malalane@citrix.com>
X-ClientProxiedBy: LO2P265CA0509.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a441809-f4dc-436b-7624-08d9ec7c9490
X-MS-TrafficTypeDiagnostic: CY4PR03MB2709:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR03MB2709F7B1BFD4DFB2940116CE8F2F9@CY4PR03MB2709.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /P4/fmcVmvIk9E/pJVbPTb8DPWbntl+TV2jgsI+sM1oHuo+cf+unCzc6KXdR5sCGOR1h3Ew0+9+xO5m5Kczhg09iwrs0pAoVyJ3K6xq3DR+jr5UvyJSI8tQ3tDruFtcN34pXytRIsejhEQuw3lq6jjaNlH+yVHyRVO1ORQR0+1iWGW8rpuoAoMsbVyFIZu0FvgEFFVm7yVyfmsNPQojagoMBq2Lc/fYC3j5OiOgxyAt1ECd+RR+Bb6nsH+aZjG9I6orC3HPqim20dN/GVAUIvV1hqHtfyfwX+IBtTNV0n1RbdzVqUdJ6sPhlIF/d2rDCf1iYF8H2WscxPSlwuTb+gj5QSEeRUzIsUtNDE41MlbbZC36aywUmeDB4tvcRM1ur82lzouXpUNsRuspki05ozYdSAsn6cXajVXHvqvYmMbqBPXgrp/Jat+Csw/20h+7eOj+cMrdAOrTQ85rNfPeOdfjFFOotG+pjR/7XpD5HVQhPl1cN92P+z9mWovMcNCnDBdsNPYga77k7DXS3mxJjIujajKngADHw9zwbkPl40V24Wvq48paL2kTW8e37pFu9PlJkOhUZOMg0L7utTigV4vsEm0jHDd5PNaCrK5vYDD9b0L24qTaEBXznol4sldHNjEXvgYI34nUS2F9GL80uHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(508600001)(6506007)(66946007)(66556008)(8676002)(4326008)(6862004)(316002)(82960400001)(54906003)(66476007)(86362001)(38100700002)(9686003)(5660300002)(6512007)(6666004)(6636002)(26005)(33716001)(83380400001)(85182001)(8936002)(2906002)(186003)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU92TGVqeWVHZElkbGpSUzQwM0pmMEg5RmttemY5c25CcjJTQWVNR0o4TUxz?=
 =?utf-8?B?WUkxVjB5cDR3bVYvczVua1ZBUEcwci83a1FYMnE1Y3NYS2drTTBVNWgwRUdl?=
 =?utf-8?B?MEZKZ0x1WU9JdXlVd2lvVWtvMTBMc1NZYkVYUjZwSXJKVTB5ZTUzSG0rU1NV?=
 =?utf-8?B?OXNEUW5aQStaajF0OUw1Z2JTNXh3Rk1ZMFNyL08xYko4Q095eFgwYVlXbkVG?=
 =?utf-8?B?UGZ6VSt3a1ZPZ3d4M2F4YURSTkwxV2p0V1d0ZVZObnVJOHVqSGhGcVJ6S2pj?=
 =?utf-8?B?KzhHQ1NDaGhhWVh3aStyZ2xPV05Ha3A2eUhVdVVYUFd4MndocVlqL2x5a3BW?=
 =?utf-8?B?V05QZm00eGNCNlN2djZIRW1FN1RHa3NVSFNpZ3lTZ0liZzdWS3Y2cVY2cjZx?=
 =?utf-8?B?U2doQ2ZEdFFHOHQwZkU3TzBqMWRXRUZZRmhRTUtaRXdRQTBHczBWWTVwN3Vn?=
 =?utf-8?B?T1RsQXBNdjVvRWNLT3o4NlhlMnREaDRkK3ptZHM5b2FUU0c3YU9DZWZGQ2xI?=
 =?utf-8?B?SEIwTEx4V2Yyd1h2VFhqQVVMRWZ3ZU1jNUE4REtjUnVyc3NlT0NHQzByVEhj?=
 =?utf-8?B?c3pQQ2RpdnQxY3QrSGo2NkZwaHFqR1MveW90TXVLcFF3bVloRm1QM0k3ZE15?=
 =?utf-8?B?YzVTQUpnUWw4VWFDZU9hNVQ5eEZCbk5zQ1hIeW9uUFNCOEFjLzdkbkpTOTlK?=
 =?utf-8?B?Y3RMaHk1TEF2c0c5ZGtVWjFlQ1RoM29PZnUrMFpwTEhhR3BXQ0xTUlJ5MEpC?=
 =?utf-8?B?VmFsUkhhamlnWUp6bVZITlppQURiQnBHeHEwTDhtU3ppRmVnQmRyN0R5M1cw?=
 =?utf-8?B?UVhQVjJLdnYyekFGc2VTc0ZVWVQ5RlJ4NTZXZndEM2VPby9QQ0xDNktzT0NO?=
 =?utf-8?B?SkovMnN0VVlpNGthNFVvTXpFME55eHg2VjR5WktKU0NrYjc3K2RxRm1YVVVK?=
 =?utf-8?B?cEhNNFFEYXZxUUxSdTQ5aVVuNGhIZGkyS3ZpbFJVRzBrc2V5d2lvQnZCVFFS?=
 =?utf-8?B?VjkrR0VGYWlONkR5cWdYak9wV0luOUVScXBHZmY4OVVCaVpkakwvZGk3RDVu?=
 =?utf-8?B?dVZOSngxVGFRZk9YSkduYTFYc0NteXY2d3RKOUgvTnNuckdWMDJLWDE0WFo4?=
 =?utf-8?B?YjdmanV4Z0UvYUtNZi9hMmwyTVFsMlJnOTZrWlkxRmQ5ekNxd0x0amVqVEc5?=
 =?utf-8?B?bzVZTk5XM2E2aDdlVmg0RHJzMEZDQngvUFZDM29QR3Y2SlFOMUkzQWdNWTBQ?=
 =?utf-8?B?WHduT2pSOHBXTUZSdVVMeDY1YUJTVFcyNnk2SUlGRUtGcjhsWnlEelBJQ2hm?=
 =?utf-8?B?YWJuL2toOG5OdnE1RlhTNVNiZVR6YWNlVzV4V1l1QmVTVkYwancwRE1IL0xy?=
 =?utf-8?B?YVQrM3lWR3BZZHZpL3ByYUY3dklHcVVDQkZKcHNyRnIrNUlhNTZBMHB5UmRL?=
 =?utf-8?B?bFRveGlxK1AzWGp6RmxMWlMwZFRPQmFSQmo4T3lNWkR1Y09qYk13V3FBVmd2?=
 =?utf-8?B?ZVRvNW5ZMWM3VnVsbEx3TDJJeEN0T0hPK0F5VDNZajNKQXJwS0Z2YnJ1eXhT?=
 =?utf-8?B?STNJOVBKVDdvUS9rSElOWXdFd09MNlkvZWR3Qks2NmkvTG51cWl3UG9YbHdW?=
 =?utf-8?B?a0tkNFc0VGUrb29oQTY4eTRMZk9BNEFmbUk2ZFo0Nkd3YmtsMDZrNHJwSmZQ?=
 =?utf-8?B?VkFLaGJEODN0SENEd3pPL0x5Y1J3RkNUYXJmTjJmdmtrUVpwam1NNlFocmhu?=
 =?utf-8?B?WXhjWkJqY2RTcmVUY2JJSTVYM05aa2hPMG16NC91M045dWg3RVVrZG5uN1A0?=
 =?utf-8?B?WURVeTIyYWF3aU1NcURUU3NsazM4UGo4R0t5OERKd2hpSXF5NWsybG9HbE5I?=
 =?utf-8?B?ZksxVDhCc0F4a3JnQW9GdmpLY3pueHVpSldNbytKd3lWRTExejBoelV1Zldn?=
 =?utf-8?B?clppODNTcUdsM0xic3MzdjZCRUdaUktUcjVFcUZjT1RGdFJ4SmM1RlZKMUg0?=
 =?utf-8?B?bFNXOHh5NFlkK1lUUHhER0xTaHF2czlrMGlMekhINnBRUVdVY0k0WlB5YWpk?=
 =?utf-8?B?T3FDbHJQcTdURE5sUkNiVmFhTFI1S1lBYzNnT2xXR1NUeVJKQmNGMUJsT3pk?=
 =?utf-8?B?NHM2U25xSlB5MHo4RWNKNVREVlFXbEJQd1ZYMURIWXNtNVROOTRMRVZXUFFw?=
 =?utf-8?Q?Gouprbt2bPSaupFV1TMcuWs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a441809-f4dc-436b-7624-08d9ec7c9490
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:03:26.4105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8mB0Xe2vjTeue+G6v0/sdCKdrozS8KfGFDI3UlKEwZZ08YNYHtXLYRKBNSw5daRpibBLc22K6/EoZurYi4KrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2709
X-OriginatorOrg: citrix.com

On Mon, Feb 07, 2022 at 06:21:00PM +0000, Jane Malalane wrote:
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index 7ab15e07a0..4060aef1bd 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
>              MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>      }
>  
> +    /* Check whether hardware supports accelerated xapic and x2apic. */
> +    if ( bsp )
> +    {
> +        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> +        assisted_x2apic_available = (cpu_has_vmx_apic_reg_virt ||
> +                                     cpu_has_vmx_virtual_intr_delivery) &&
> +                                    cpu_has_vmx_virtualize_x2apic_mode;

I've been think about this, and it seems kind of asymmetric that for
xAPIC mode we report hw assisted support only with
virtualize_apic_accesses available, while for x2APIC we require
virtualize_x2apic_mode plus either apic_reg_virt or
virtual_intr_delivery.

I think we likely need to be more consistent here, and report hw
assisted x2APIC support as long as virtualize_x2apic_mode is
available.

This will likely have some effect on patch 2 also, as you will have to
adjust vmx_vlapic_msr_changed.

Thanks, Roger.

