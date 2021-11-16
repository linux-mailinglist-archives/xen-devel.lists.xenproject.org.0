Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852134533B0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 15:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226289.390984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmz7K-0004ea-3F; Tue, 16 Nov 2021 14:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226289.390984; Tue, 16 Nov 2021 14:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmz7K-0004bg-0G; Tue, 16 Nov 2021 14:07:22 +0000
Received: by outflank-mailman (input) for mailman id 226289;
 Tue, 16 Nov 2021 14:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MDL+=QD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mmz7I-0004ba-8U
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 14:07:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 818b9c85-46e6-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 15:07:18 +0100 (CET)
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
X-Inumbo-ID: 818b9c85-46e6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637071638;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YD+4vr8+VYKhXKY5ltavifruM/lAO6oGkOGfo1IYyv4=;
  b=ELFtJ8wVlfZAj+ZefvR/An75SkMpXYFUeShfJfc6mA5+HuigX/IZkilT
   ZBzj3AGpClgmqGU47a1+GE4KsyhGOu1HaOqKz8pv4SjbCM116v6Ye1f3/
   FShaLRsJg1U91nY3phauFoTZv/fK6yctPqUYu1dVj0vk/54EVGyjj6ghY
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8uVnP5+cAHCgFbfIdyvYdyQzYYk11wNe+bLg+nPQT39bTlHqe0NYavi3ng0BwYi6QEKERDejmJ
 G5pvytWL4pm1qIUJqTv+Gl4VylFzMeNGva6eJlmFSFp7F2wWwFbUWcyv9HXoQvhN3rxESxbhwe
 bLWB3L/5LprAOfSrogt97CzRuSjYG7vdtlHdZrqlvRQ8Paq2I7Ndkb7xePHeSt88KWsDjjQQQO
 ZFCbJjwlP3xkLLVTPWjeJlCkXBfDjssdQUAXSfOCN6YYnZ0J3yrbUuG4xiqUWsi4jbVqpR0CdQ
 DJ2HpZd9k97I4NVyzY1VNQ9V
X-SBRS: 5.1
X-MesageID: 57455856
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UOYxIa82eq+ksgwEL2t3DrUDdHmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 DEcDDjQaK7bMDSge9klPozn9kgAucSHy4dnS1Ro/Cs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdg3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhM0
 Mp/s8W3dTtqEa7CtOUPUylHTH1XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFg2tt25ATQ54yY
 eIDdmswUTf9YCYVI0YHBrMBs+Wmj1LGJmgwRFW9+vNsvjm7IBZK+LPqNd/IfN2WVINQl0CRq
 W/c13T0BAkAM96SwibD9Wij7sfOgiHTSI8UDKe/9PNhnBuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWFTGWs50BGHYAKSqtjtV/LmvG8Dxul6nYscyZeWtp/s/MKBhMp2
 HOIjdPZGmMzmejAIZ6CzYu8oTS3MCkTCGYNYy4YUAcIi+XeTJEPYgHnFYg6TvPs5jHhMXSpm
 m3R8nBi71kGpZdTj/3TwLzRv967SnElpCYR7x6fYG+q5xgRiGWNN93xsgizARqtwe+kori9U
 Josx5j2AAMmV8jleMmxrAMlRunBCxGtamO0vLKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcEIYyPyNPQuP9/hUKzGKJQM8/y/DZg4ifIUPPBMmPKvpnkyNSZ8IUiw+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48gPUwDnUgDKZfobcmjlXyPiOPGDFbMEOttGAbeP4gRsfLfyC2Io
 ok3Cid/40gGOAEISnKMqtB7wJFjBSVTOK0aXOQLLLPeeVQ/Rzl6YxITqJt4E7FYc21uvr6g1
 lm2W1NCyUq5gnvCKA6QbWtkZq+pVpF6xU/X9wR3Vbpx83R8M4up8okFcJ47Iesu+OB5lKYmR
 PgZYcSQRP9IT22fqTgaaJD8qq1kdQiq2l3Sb3b0PmBncs4yXRHN9//lYhDrqHsEAB2ouJZsu
 LanzA7aH8YOHlwwEMbMZfuz5FqtpnxByvlqVk7FL4ALKkXh+YRnMQLrifozL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSDpzit245NVuqMbAvxbmKs9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy7IF6wu7X
 kWDpotTNbmTYZ63FVcQIEwub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4YNE/3
 OMsmM8K8Aju2BMlP+GPgj1Q62nRfGcLVL8qt81CDYLm4ubxJoquvXAI5vfK3ayy
IronPort-HdrOrdr: A9a23:+TWWHKnbe/oDtr1j8SXC7HcBeDrpDfOwimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftW7dyReVxeBZnPHfKljbehEWmdQtsJ
 uIH5IObOEYSGIK8voSgzPIY+rIouP3iJxA7N22pxwGIHAIGsMQnDuRSDzraXGeLDM2dKbRf6
 Dsn/avyQDQHkj+Oa+Adwc4tqX41pD2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr6G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTohOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsIuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DofuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjHkV1FUsZ6Rt0kIb1K7qhBogL3Q79EWpgE286Ig/r1dop9an6hNDKWt5I
 z/Q+1Vff91P4krhJlGdZI8qP2MexrwqCL3QRCvyGvcZdU60lL22tXKCeYOlauXkKJh9upEpH
 2GaiIAiVIP
X-IronPort-AV: E=Sophos;i="5.87,239,1631592000"; 
   d="scan'208";a="57455856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3knnpwEjxuKzZu+TBLU0btTxeQ75IhGm/7kiM3vEmV96EpYzyGotDapTPICnrb5ToFLn55/OW9dK7Qh9f0AKpy2IIk9NA3XiOGLtGGNW2mwqKm3dbH5S0sVj0JzF7kYpPfVdJexnQIUxDDZYk7eFSCYBYhgC3je1cgnY5hnGdjJ1Sme+z/jst+0cZS4GBW52qHrtaPIWdhunLguWLKr7GDUdKoFoqJSClThi1/WJNH0SVaiYwHUMo/j6gt2Q1cbbfsRoAmj47nN0HHyqNlIRyfRLs6/P9cTUytf8aIqs0/q1uxkLdlODReJOvPAIQno5wpR9nZogO0ie8Gm6ueRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdHS/txhM1NAJQDOIbGQsC36UWj+N4uRXCQRmxNzhig=;
 b=QngKX3r8JKwhbmxuKH6f/LMvtXPBtqjhWCVf9lGEpjXjlDem5D2cEZu/fJJrg2u+nB7CiViKhHo9eBAM/WQnwKkUJrJm7/Vqw4EHUjLGzrCR+qsIWN095Iu4QBS+R6FlA0sEgZWOEcJDrQD7z5RdkwHn0cDUhZTQbXMSB7XlNcQd1JO/ULE1btq/fsAYbob8S6bKuqenEJwD6p2lWxJ4fm8mlpyjwdgJ9mv0dsclSkf8KCh/R/zrYdrZoWGuYYD5Psm7zMwGA7AnmJX659I1awG8mdJgBO1kglxB/JpBe8yaXS9KRmdNIckoDzV3CIfygO9BVqU4Sr9IhWDiWcWuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdHS/txhM1NAJQDOIbGQsC36UWj+N4uRXCQRmxNzhig=;
 b=YlbGTkqtJI875EClhgaDijRDUx957WB6Dlw9h7I1uYya5b/Cf3Aj5a0MRCzU2AXEP3eJ8aSHN8ythHmHV0fbx9sIZFYHnYTDk2VjzXGvvxRF8LnFUhcT/vNDKJ2uKa2ir0iOVgh6hWZ601OE9uz1SICEl6sjxPFBVLpKk+8B/ak=
Date: Tue, 16 Nov 2021 15:07:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16] CHANGELOG: set Xen 4.15 release date
Message-ID: <YZO7DUxImIy0Wy+W@Air-de-Roger>
References: <20211116140344.10766-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211116140344.10766-1-roger.pau@citrix.com>
X-ClientProxiedBy: PR1PR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::46) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c45bc685-2a43-4288-5325-08d9a90a63c8
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:
X-Microsoft-Antispam-PRVS: <DM4PR03MB619228E1565A49825C7152678F999@DM4PR03MB6192.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40Lxsc1RFGeOlV4Cv4xSXuCliqRm2qd78FZB19dDZ3AEQtR1Xce5hTrsaD5UGfR+tb0JQfUJ5Vcs5/mpFomY5TXhf5Vw2IMw8aH/tE2XrFru9+Bda8MHoogYgMI5uYI6ICmS4288jalby/Gpsn0olB8zZsCZDD8zhTFrFXc639UCvRD/LLxoSSp4bVrbknniWc8efbwgR/HwAIepGqF8taS9JP/8jCqyuhsKaeGc5cojO9NusqijPmvCjzkuwkQaPH/cmE+YlyS4ZZvSTcA9RJ8I4aB7meGM/jmkhh30AgDJOjKIpUWHrlxNyVTPKAErT6dBS99cpOwGN8X/H6KH2+8fbTg1ltDGbsFS8lRjPHAaREqks7I9q4b2BX5MBeBrfQEBefl9KVBxOxV+Q4zffj6/Lx2+shObVVCrabZXID7Klglw44TK/v5LXDde0IYNqArUAusY8pPal4F0kcc6Joouh0SuRXzquh5tj7wYwzCYsqkHsTOJk+u/zpWY7ZsKRPPB/sHglZfu4ZT2pGBaNTxPzXv3KvHgZOqLanKvCayOBlngSguT7VKEnK5+Qv1TjBJVbkihBHpSJqw84nnbPn6dnQ0+30a9Qtl2/RwSZFxIONaxkjudneTCbaSjjYWV+cYP10P9bblc47u5S5S4hsOloOS7AxVf6xKw60STNgTPF1XdcuuGSONi2GTr0B+P79Oa/yzP2tvfYtYkM6KaW37AhCJX6pk/b0Bp2rlRkf9OnAv1L20XgfjytCW3oExa0smnawTL2QK7WEUOJ/NZUwKR2/iZksJWCY6yAlPGIpDLCd8FSDNXODa4KlyNNNF7ekHhzyNorDFVOUWJ3KwMXigrDsP1gZ/xSQKNDxRAzAr8xOiBEDSynHKSoHW0yQOZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(508600001)(33716001)(82960400001)(83380400001)(66476007)(8936002)(66556008)(6496006)(66946007)(6486002)(956004)(38100700002)(9686003)(26005)(54906003)(4744005)(85182001)(4326008)(6666004)(5660300002)(2906002)(316002)(186003)(8676002)(86362001)(6916009)(59356011)(219803003)(207903002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVFRYnN1VHA0WHpFRVNNTUdmK0J1a201cDRpTG9BTkN1blgyT3FyRXJsYWUz?=
 =?utf-8?B?RHZXVk5HMEI5OWUra1BLOUZWUEVLQTRseGVrV3A3c0NQVTVBVnV5VnZtbTRP?=
 =?utf-8?B?ZmpsOG1XOTB4T1J5aUw2M29BeWNKQ3lydnFwVzVzV0oxZ0RqUjJHQ05RYkFM?=
 =?utf-8?B?NVZDeEYwNUNWMkF6TVN0NE5BcjZ6NTJLcjNnM1NManhPaGhDcEZSWlFxcXk3?=
 =?utf-8?B?UWo5cHJnUHpVN3JZZXVRMHBlaEY2YjBOUjdqMllMZWpyZS9zTjBmK1k2dGR3?=
 =?utf-8?B?ZlgvTy9sWlB5MS9CQUtDM04yaTdkM1BLbk1lRWFmNmhWUUVHUnIyNmdjTVRJ?=
 =?utf-8?B?K0hRcVkyT0QzZTVKSkRIUlVNbWdWSkpFSngrWlhEK3NFTkh2K3kwQ3BiWlZv?=
 =?utf-8?B?VDhMQWFZRnEyZjRLOXdTK3RXYlZkcmtjUmdxS1NnbkF4OXRiOHFEdTI4NFpG?=
 =?utf-8?B?Nnk1L3FVYzNobVJCazlIalcwSzNVNjB4czlDTzBNWGhxa3FTbU5MY0haUzZW?=
 =?utf-8?B?SHdXQ0NIYnQ4dUdEQUNoQnZ2YzNjSVJXT2FGU1dNNlVvTjNHblpybGg4eWRt?=
 =?utf-8?B?RlRYdVc2a1lHM3k0bG5aQ2ljb3FlbURkcXM5bThsVkdRMnluMWVpYndBWEFG?=
 =?utf-8?B?ZUN5OS9XMW5Pd0xwL2FCRFhNemNuTkJOUktTb3BOTFhtUGtxVlV1T1dnamxY?=
 =?utf-8?B?cVVXRHpyaHpiMXpjeGVRS1RpMTdqL0xjWnhUbzZsaWt6UE1HdE52ZnJqdlJj?=
 =?utf-8?B?V2JTZ0tuS1lrRVVCbUVhUjI0MGRCcW5UTVhCYjlOMkZ0TVNoMHZDR1d3RG5w?=
 =?utf-8?B?Yy90VjM4bi8vOHFBaWNwdnZydVM1b2c2QVZrQWk4WXg5R0llei8vcDg1ZTlH?=
 =?utf-8?B?Y3RPQVNKRjhEYk04RHBIMFRMUEx4SGNHdjQ5UE9DSW1SS3dFMWlua250VXh0?=
 =?utf-8?B?WlNkVFVsTm14Ry9od0FPcjFXWG41S2dyYm9EUGNoTDdUaWtKQWdmMHVwcjZC?=
 =?utf-8?B?QlJ1aFBHM0NHU1Mwa1hXK3VLWDl5ei9UQnM0VlVUOVhJWVBpVEQxUVpuSTZ2?=
 =?utf-8?B?TldQcmJhUVV1RnRneVJkekZ4K25aMXVtT2VkUUlOaWVKcFVNNUtlZlFXWTNq?=
 =?utf-8?B?dEhUbzFDU1lhWktDcEpyd01qNjVEQWFrMFJWOTIxZGlLRlJEa1ZyZTZ2dkRn?=
 =?utf-8?B?bnIwcTVLR0wzRjdkT2poYlp4T2ZXYWRFT25MTi95TnlZb2poL1h6SGZQclZD?=
 =?utf-8?B?UmpmVVk5K1Z2bnNiNmxZQ1FwZlhPRyt1cVlrRzRxZ2UrNkpNa0RGTDhlR3NY?=
 =?utf-8?B?ZnRWYzl3clh6WGM2djBzS3JhdFh0U0xEV0MwUDdlMFRNWmpyUFlDWnVjUDRa?=
 =?utf-8?B?bmVGOGpUeG1yWk1tamhIVnZkcjZ6Y2V2UVRYRitwdit6TldmNkowSHB3YnNX?=
 =?utf-8?B?TkloUHlaSkNmZlFpa1BKd1lZRVB5amRkZGl2Ri9PZkViSzQ4dHNFQlQyUm1H?=
 =?utf-8?B?TUxqRnl2NXFFNldXOHZrN2tRNXZNQWRJMU44emhScUx0VXpFTmNuSFRMUXhi?=
 =?utf-8?B?NnBXYWVOYlg5cGZBTnQ0bzM1VWJubTVRZW5kRlZlVVlFTEZqeHZCVGFYV0VI?=
 =?utf-8?B?YkQremxDWDQwSko0a0VMcjFiMDgvQmZUdTNnOCtHa2tSQlNaa0RQWmc3UXlF?=
 =?utf-8?B?TzRJVys1czVXZkpyMVp6dGhIUzhYOXFjZ1hKUUJLMkprcm8zYzBobm5hOWxy?=
 =?utf-8?B?a2ZPOU56THlrQXdzVjIxU0hLaEEzVWtLOS8wUWRrUklKa3d6aGcrVGorTlhD?=
 =?utf-8?B?YXVDZE1FNVJNVHRyZ1Nya1NQUllsSjNJVHkxa0QzRjJpOUNEdUZIN3pyN0hX?=
 =?utf-8?B?VFBOSGlwcXYvNWJtR0dkdU1veGZOZ0NxZXZxbVpLNWR3Tk92QXQ1S1ppemhu?=
 =?utf-8?B?ZUFkRlB0WTd5Mk1OV3FMVVJXWFBBWWJFQzhxL2hxeWphNjQxTHRSTitVT3lo?=
 =?utf-8?B?cXNJZFlDcHVjcS91RVl0Tjh5WmNZS3UwYzVGalI0dDc3bG43eFJMTWJ0REJk?=
 =?utf-8?B?SkVGSzJSRUZVNVozR3FQbTU0Njc2WmUvS2M2V2tSZElLa2ZCUE9hWTU2aHpP?=
 =?utf-8?B?UmRxWC8zWTg3QTRkNWt0RE4waERwa0d0ZW03SVVKNVlpcjBrTElUZ1ZZb1Qr?=
 =?utf-8?Q?sNj8Ift4tnNefNLDVrAVRFw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c45bc685-2a43-4288-5325-08d9a90a63c8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 14:07:13.9491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saL0dDWDaaCBtjG/LPGtDEiJK0CufSyKLFyEHyTbdD7jWtqiQ9T8n393wsAZxzVzQ040hHrkbe7I2xcyGyxM9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6192
X-OriginatorOrg: citrix.com

On Tue, Nov 16, 2021 at 03:03:44PM +0100, Roger Pau Monne wrote:
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  CHANGELOG.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index e5ab49e779..7f3114a96c 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -22,7 +22,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     no longer be built per default. In order to be able to use those, configure needs to
>     be called with "--enable-qemu-traditional" as parameter.
>  
> -## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
> +## [4.15.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2020-04-08

This should be 2021-... Will resend with other stuff for CHANGELOG.

Roger.

