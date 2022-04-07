Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0817A4F77E5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 09:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300461.512535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncMmK-0000yo-Vm; Thu, 07 Apr 2022 07:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300461.512535; Thu, 07 Apr 2022 07:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncMmK-0000vY-Rq; Thu, 07 Apr 2022 07:42:04 +0000
Received: by outflank-mailman (input) for mailman id 300461;
 Thu, 07 Apr 2022 07:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qv4n=UR=citrix.com=prvs=089d11f18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncMmI-0000vP-G0
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 07:42:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33ef43fa-b646-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 09:41:59 +0200 (CEST)
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
X-Inumbo-ID: 33ef43fa-b646-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649317319;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=BYI35DPL5ZAdeR7w/J+YiEEZGBRL9DYWE7YRtZYqEZ4=;
  b=XtP/rSDfvD78g92eDmPlwng9qjFqGEIdcyvUvEt1MSyV5HTBnjKycN0G
   wibpIMyoWqzsjh3TiMvqxqqg2WdvKpv05XA/HLCl2CkoAmURVjJImQfv9
   wEzFr30kR2ZG4Hp3xrGPhtKY0T8EUHeCsbVH0zc4YM4NPET067jipPe8Z
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68130971
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DVWhN6PMqXHxKa/vrR2Jl8FynXyQoLVcMsEvi/4bfWQNrUor1TZWn
 zMWXmCBbK2NMGvzetB0YYTlp0xUvcWGmNZnHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tEw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 ugRvoadUBcQYajjiMteUUlCGTtzFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmdp3ZgfQq+2i
 8wxRDZEVB7pWzR1AE4NWY8Dn76qgUm4WmgNwL6SjfVuuDWCpOBr65DuPcTUfJqWRMxTtkeeu
 m/CuW/+B3kyLNWCzRKV/3TqgfXA9Qv5Uo8PELyz9tZxnUaegGcUDXU+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yENopTZFBYAWSbdjrljQlOyEuG51G1ToUBZbVYAtruIvVQV10
 3CZsJDrVSZlqrC8HCf1GqivkRu+Pi0cLGknbCACTBcY79SLnLzfni4jXf44Tvfr04Sd9SXYh
 mnT8XNg3+l7Ydsjjf3TwLzRv967SnElpCYR7x6fYG+q5xgRiGWNN93xsgizARqtwe+kori9U
 JosxpD2AAMmV8jleMmxrAMlRuzBCxGtamC0vLKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcEPbSH6MPInPN3oUqzGKJQM8/y/C5g4ifIUPPBMmPKvpnkyNSZ8IUiz+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48gPUwDnUgDKZfobcmjlXyPiOPGDFbMEOttGAbeP4gRsfLfyC2Io
 ok3Cid/40gGOAEISnKMqtB7wJFjBSVTOK0aXOQLLrXTfVc8QDhJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXVE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:NoDw6Kqs4MqZbzyKKOt7zGoaV5uyL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTUXsGIP41qj2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwryG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTo5OwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbs2uatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DQfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHj/kV1FUsZyRt0kIb1S7qhBogL3W79EWpgE086Ig/r1fop9an6hNDqWt5I
 z/Q9NVff91P4srhJlGdZQ8qPuMexzwqC33QRCvyHTcZeg60iH22tbKCItc3pDfRHVP9up0pK
 j8
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="68130971"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsX7w0K3A2QeVbsOEypXFE0QCVStW5HlcOR8STEGJEqKKmcjSvcE4SfLPaHII/p62DmZ7f56Tx9M/MC1vg4dpWbtDv67ll9E0Vqk0GCh2XvlHKAxgE6Xm6vXEv8or9p+9SJAfyNi+gtXLkprJCT0Azdf7PZH/6OwDKBQWO4MfslSlPbI319m/bzWIw4pbxpvqNgbqeMxormdDz3yaQR411ZwHn6dPNgvLvm1QUNdDjiu74ZROIYgbd1ryD6qVsTOU7Ho1qV/acS264FohNYD4vd8obXECtRFyuYyEumQS0jhCuTadzVnAVJGY8rwDg1KSIeRWn2omOTBALJI+m7kBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5a0AwH1+6W0V6mgG4NE1u8Cpx6mBKVJKukjtzyKPCg=;
 b=lTGct5jippnUPw5labweW7cjVeEW24/qPB4VEjAouHaWwhEsBWiVdVb170Ad/nE2eHfA2TkEfh/BWS/3ycDP2EDcpYSr/H3vAOYy6ztzOYk321+MODtvkpaIPLB6GykFuO/UazFMBDvOYMJsSuRXEW4lKtyQ6F1ztiYcsaX+g5HJ1C3vs/yzU8DVWArtBlCa0uOXL9tCXZysNCJ0h3WmcUuzcM2UFnK2rfDzCk5fYrOriAR5hV0G6DBcuSDGsc3tJCMqYAFq/NZUONjGUilaQ05QY9NXhZlSeaLBjD3T08Yhf52mejFUvZPxnv8IBpISz7wzytPYQ9gZIQL9Nq7xrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5a0AwH1+6W0V6mgG4NE1u8Cpx6mBKVJKukjtzyKPCg=;
 b=W3YYHyHROrotqMOvxFmzPXvRHZa4+J05BiJ6JTH9Gf95RDt++smFpXAbDW5+b4tt95NSiuElEAnhUas/vlemST+zNE90qRnWKtoDGCL0f13Ef9aEJ+nBQfoV1Zt+QjXlcevM9t407yToUDgIfjaDG1Ka/Gjd2XcUBfeSeVPPT8A=
Date: Thu, 7 Apr 2022 09:41:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/2] VT-d: avoid NULL deref on
 domain_context_mapping_one() error paths
Message-ID: <Yk6VvXJHWxJZTgeF@Air-de-Roger>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
 <6739cf19-a74a-208d-82e8-28dfde7710f5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6739cf19-a74a-208d-82e8-28dfde7710f5@suse.com>
X-ClientProxiedBy: LO4P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcde59e6-990e-433d-c61b-08da186a1627
X-MS-TrafficTypeDiagnostic: BYAPR03MB3719:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR03MB37191C7AFC542DA71707F1228FE69@BYAPR03MB3719.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GfWwYuQDHXa0LjwVPVpMHD01X9AdCtfp3/BYw7JdSjpjxDP+cOrHauRCptNQ5lVv64OcPe0iLz07syZH4ew0SCEbyruxrt1X6EZv5vlNqdRP0FpzinVpx5CjHw7V5XuA9RfY6JHZZaNuwcNncoaxpi2URN97CQpWwa9ax/QQZzlvUY7e3MUBlAyYONWznazuRxHi41NaMxBfZ3bDX8bLKVR8y4NXUgvqxn3KPWrWk7g7XPkM3WAyZb1h5TtwlmYlDpbhvasJHOpWUOhKdaqSwzLmOEYsjVeNVnRZyI8C5tcAGPWJ+mzPiIKWOeZr+dV+cqYmJz4cXp/jjiKt+uZdSEznulht7ArNcHkmVMFwxzTtQ2vlz1lgFvvwZVrYzGsJFSkWXG+OaRzZ0Ef8oidYlRcjGfwwEcfj4l22bxGkQKmO/85/TLOxSPPcxibXB4yxEhmq1Ae0TYtiYr/PhXAUr5eHw7M7GKXPBSzzzAzR52cxnmf04x565g+ZuQXNSJi84xfRa26tTAYMrTo+lVU5A+YG+r33nwSexpyzLZwbi7yKXZd2Gg/u6Em3cBv0wt7ulwabBzuWFsyGQuG02CDTouNv9dZLPWEXTaOzeqDNoYpQUF+KofXOaK6WulIl0UG51cqk76hSj4kr4c9g7+WPXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6916009)(316002)(26005)(38100700002)(186003)(54906003)(33716001)(82960400001)(85182001)(9686003)(6512007)(66556008)(66476007)(83380400001)(508600001)(86362001)(6506007)(2906002)(6486002)(5660300002)(66946007)(4326008)(8676002)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ry8wWm50NHNQQTFaSEdSZE1kdFZOWmNzc1ByOE9XeWIxd1JZaDk3aVJMS3c0?=
 =?utf-8?B?bmtyazZFdHFhSllsSCs1aDJlQ2pncG9iczhQZEpGaklmWmlxUFRJeUFJSi9N?=
 =?utf-8?B?cng4N013ZHZmalA4QWtpSFlaTFVLVU1wRlU3aURZcWx2eVlFaUZQRTRJZHV4?=
 =?utf-8?B?dHQyNGVRa0R3bnMyMTVVSkYrUEhPejZxK29EWWk3cHpPUWtOT3pFdXRKOVRM?=
 =?utf-8?B?bWkzeWtXakc0Y1lvbFVYcEh5VTk4VXgzMWdzVG44endxbWdtNDB5ZDNwSU8z?=
 =?utf-8?B?RjhXRWVvMUxOWWhrbUZqNXZKeEt0dTZiZHlFQWpackZ5UlNzUEQrK05PTWV3?=
 =?utf-8?B?QlJ4NjJNOVNyVXJFN0xzeGJONHNvVXFoTmRHWjEwR05zbmNXUUNNLzAyRzNs?=
 =?utf-8?B?Yk5nMnBveEZadzBkOTBGWVNCc3BCZklrZlhEb2hHZmpqWWhkdVFqTU9QcVl2?=
 =?utf-8?B?dzd5Tm9XYXlzbzJWWGxqMVF2RFNaSzAwMHhwZnQ1Vi8xVkVkbkpZMVdlTGFi?=
 =?utf-8?B?clRLRmRCVUt3Q1dQcWpKM3gzSm9MM3pVZk1IbGdHbW1MemxIWUFMTnkyejhJ?=
 =?utf-8?B?MEhQbjJacks3eVh3eXk4YlJHTTJFZEgrWXNuS2xETVNNS1N5TDV3TGRRS29P?=
 =?utf-8?B?VVBjN1RFUG1WYnF2OFRUZXJKcWZaL0NkbkJFaDFrd09tS29ZdUh5T1BBOHRQ?=
 =?utf-8?B?Vm0wd2RtZHpKNE1hY3VyaXVIK1ZSYXJETVhrbWh3NnEweEdabVZDZkQxeURl?=
 =?utf-8?B?SkQweEozM1dubHpyRDdHUkx4b0RUb3hwYUJUTTViaDFueVQzOFZoM1Zna3k4?=
 =?utf-8?B?WkpJVUo1N1FiQ1I3dVllcFFuR2dScHJhWU1wSTBDYllRUlZCbTlXNmxveW5T?=
 =?utf-8?B?dG1oL21RSkg1aVVsbm9MbUlpVElEYmdtc0doSStFSEV3NWh3VlVCckg3Yk1X?=
 =?utf-8?B?NVNmVDlQYnlvV1RpT1NHNUNSNjNQU1NqR0ZnL3BkZEtyMUdSYnJKcEYzRDM0?=
 =?utf-8?B?Y0pHdGZsVkNKcGJ4NVdQelZWSlBYMUxMbkxDakhxMXJseWkzNGlON2hBNlRI?=
 =?utf-8?B?bWdBOHhFQlY5VkM4NENCUys2L0ZZRVZyam9WTWsxRklIbFFBODE5VEYzMWxZ?=
 =?utf-8?B?MllQQ1lhSnZldEdESTZsdU5lWVVqb2g3ZjJ6QlAzSnl5cEZNNXpJSmJPTk8v?=
 =?utf-8?B?eFRkeUh0N01lS1YzU2lsZ2dQak5LSzFIVVNYc2xkMEthUWxlendUdEZ1dGNh?=
 =?utf-8?B?RmVKTHhJV3dLbVdtNlQxMEdxWW9LQ0pNNHVKcWV5NmsxcjlLaitRSDVXclJ0?=
 =?utf-8?B?L2hFdkRIUkRxWExhUzJXQzAyMGI5b2dxcTNBaGh2T2psV3F5VWZCRUVhME5t?=
 =?utf-8?B?RVlyWkxaUFJjYjBCT0VKSmltVkVjYzZCa2lNdzVWRVdjdVltVGRPUFlIZDFZ?=
 =?utf-8?B?dXV4QmpBUldpVTBkaDI4T1hLWXo5S3pQQzVXOUFFUkp4TUlvb0tZSDZabmJw?=
 =?utf-8?B?ZkRGTTY1Q3M3WkRrdWVWZEVGRDNtcVFxOU9IQnlXbUt6V0NFbmxlUy95aEZl?=
 =?utf-8?B?LzdudGx1cjdLTGxEUXBXMHpFeDBDdjkvcHRvb252N1JhbXA5R1J5QXNkS3p3?=
 =?utf-8?B?VEx0aVdQZi9Oc2czTHFGc093QkFDOVYzbjY3QUZNTFd1TW54UHc3NXBGeWR0?=
 =?utf-8?B?WTNaZWV2dzRyZkpSMHZtVnBha3dmQms0Um1XK25RSTg2clc4a21zSW9kQW95?=
 =?utf-8?B?MHpMbDBjblFMYlNiM1dybVZHZUxNbk1VblBqczBQWTlvclJsVHg0WTdYT2Zo?=
 =?utf-8?B?dFRleERXRE5hRzF5blpaWTZ0dzFyeFlvdDVzN0dvRmxpMm1OalR4c0puazFL?=
 =?utf-8?B?SFFjMU0yMDNGT0t2M1huS3ZLclN3Rm5EMkplbmJyWVlXR3hudlJsNHVDdjYz?=
 =?utf-8?B?N0R2eHpGdWNtbHhyY3ZkNk9GeStyOWUzZmlkbTBDd0RSKzBwbFpMczk0THhL?=
 =?utf-8?B?b3pWYTFhTUtYaGhvdEtXcW0rVWtScHEzbE41ZHZKK3lTdTNKc09Xb1pncWN0?=
 =?utf-8?B?ZEVJNktBREdMdjNBUy95eW85QmdndFNhK2lBWHIwN3ZQWEVjY1N4OFFEayta?=
 =?utf-8?B?cUpvcGlIV0k3V3h0eG5CS0dNbTRHZFJVbjR4ay9hUWRJcWRpMjFmNWllb3RQ?=
 =?utf-8?B?clR2b28zRnVZZ3lZbFh4UDhIZS9Ic2JrNTlEWEs0NXIxSGJvdFRKVS9aVTM5?=
 =?utf-8?B?dTdSaWZ4MGdBU3VvbVhQRTZSTWhLTTJOVDRIRGJHTmZPcjdrVWhwbEVMak96?=
 =?utf-8?B?eXBac3VlTzJpWVgxRE5mQ1k5TFFwbUErMmxoaHFIRGltTDl5K2Q5em96RnJl?=
 =?utf-8?Q?9HKpeN9r6hSxRBHY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcde59e6-990e-433d-c61b-08da186a1627
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 07:41:54.5682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H31nuf30Rj283y2vhAJbcjgouyesbKk8wzXObME8Ifk/YRW2DUrVUTOZFl8mDqD4jotWZ3EoIS28QFQHgJ5qSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3719
X-OriginatorOrg: citrix.com

On Thu, Apr 07, 2022 at 08:11:06AM +0200, Jan Beulich wrote:
> First there's a printk() which actually wrongly uses pdev in the first
> place: We want to log the coordinates of the (perhaps fake) device
> acted upon, which may not be pdev.
> 
> Then it was quite pointless for eb19326a328d ("VT-d: prepare for per-
> device quarantine page tables (part I)") to add a domid_t parameter to
> domain_context_unmap_one(): It's only used to pass back here via
> me_wifi_quirk() -> map_me_phantom_function(). Drop the parameter again.
> 
> Finally there's the invocation of domain_context_mapping_one(), which
> needs to be passed the correct domain ID. Avoid taking that path when
> pdev is NULL and the quarantine state is what would need restoring to.
> This means we can't security-support PCI devices with RMRRs (if such
> exist in practice) any longer.

The sentence:

"This means we can't security-support PCI devices with RMRRs"

Seems too broad and could lead to confusion. So I would maybe use:
"legacy PCI devices" or "non PCI Express devices".

> 
> Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
> Fixes: 14dd241aad8a ("IOMMU/x86: use per-device page tables for quarantining")
> Coverity ID: 1503784
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

