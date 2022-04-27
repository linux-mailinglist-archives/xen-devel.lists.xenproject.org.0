Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59FA511376
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 10:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314531.532625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njd1U-0005XQ-QL; Wed, 27 Apr 2022 08:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314531.532625; Wed, 27 Apr 2022 08:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njd1U-0005Ux-Mf; Wed, 27 Apr 2022 08:27:44 +0000
Received: by outflank-mailman (input) for mailman id 314531;
 Wed, 27 Apr 2022 08:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ll0K=VF=citrix.com=prvs=1097e264f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njd1S-0005UT-P3
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 08:27:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e61f7643-c603-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 10:27:41 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 04:27:37 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN6PR03MB3613.namprd03.prod.outlook.com (2603:10b6:805:4d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 08:27:35 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 08:27:35 +0000
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
X-Inumbo-ID: e61f7643-c603-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651048060;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4OwIQ+2J736J6CmQAC0IqmdQsGFut6DEzlFudpTNk3I=;
  b=Yv/65soOWwxxfoLvv/AFuEvE2EFCtO3grnBKvL3zSillf/9++KXXsejb
   pS4xW/98ogCYII9VflbEoqo1RojE8MxAm86K52MGByU91GMPhtAH3Aw+i
   x8VcqIeiSBxcQCL9bhHwMhEUOmupZgWBZ/4mib/CLZjAi55/SmXqWoAnQ
   c=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 69420012
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3sGa3a4JXcq8pqI1yjYoEAxRtKvGchMFZxGqfqrLsTDasY5as4F+v
 jQXWGCHbPyNamX9eo11O9/l80gAu5LUz9VjSQA6/CsyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjXVvW0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSoeVp1DveXx98MaEVkMX5nL59o5pjudC3XXcy7lyUqclPK6tA3VgQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfibo4YHgV/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2MJ9AjN/fNti4TV5Ddbyoi3OvT1Rs2Xe/tph0eGj
 0jJ8GusV3n2M/Tak1Jp6EmEgevCnjjnSZkSPLK9//9uxlaUwwQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzW/pHOHpRcaV8BnD/wh6AqNx6zX5C6UHmEBCDVGbbQOq8seVTEsk
 FiTkLvBHzt0uqeSTnGb3riRpDK2fyMSKAcqZyAeShAey8L+u4x1hRXKJv54C7K8hNDxHTD2w
 hiJoTI4irFVitQEv4254FTGjjSEtpXPCAkv6W3/YGWh6Q9oYZ+/UKah41Pb8PVoIZ6QSx+Ku
 31ss8KT9vwUBJeB0imEWvwQHaqB7uyAdjbbhDZS84IJ8j2s/zuveN5W6TQnfkNxaJ9bJHnuf
 VPZvh5X6NlLJny2YKRrYoW3TcM30aznEtejXffRBjZTXqVMmMa81HkGTSatM6rFySDATYlX1
 U+nTPuR
IronPort-HdrOrdr: A9a23:zg4ccqAKH5doKsXlHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4N6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1wjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvW/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdb11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj4lLYIk7zI9HakGOuh5Dt
 T/Q9pVfY51P78rhIJGdZA8qJiMexrwqSylChPgHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.90,292,1643691600"; 
   d="scan'208";a="69420012"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhg1fQfV6K6/b7uqeXjmbMxFZLlEX1RHkzfejleBqdjho7ZdjBmtxlWuQuMOX9N0gds+X0AUdMXsCz5ic4sOMeOzFAe3sGF73G9U6ZwKiXeTwZIKWPskF5LQFAkETEjMTfn8B7j2PxspdiIiW7BaD/DWNOg9a37XOEIuPkg7ubyvB/Ng1yJpGfz7xYMVhR8KCHOL2dl5tiEQWXeRMSHmqhZki3Uc91RTWWEMkWKHTFWfKvRRxl4xseckd/KYbOGFNs12p2gxy5ahkoInCnLjMvsFwQW7E2WcSewbVwHk6VE++Y7Sj3nM8eox9fYAunTBISzmyjKOAOuGmh/dDMxBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsXDIthQjx5xO+nvjnKloZWxmayyyz5OMdUOQZhTM5I=;
 b=l5oj4xEcTlSo09E8eqrHrasOOstmKjmE/8SJuulJZ/WVTu6T7+c5H+knaTbn7NFKnggDeb5/ZhTWpvQRhsXyXYtaXx5zPS3lZ7jSvLdXRxz5FH7/Uui3Dc71q2uCxlwoPBSa7ZEPBhN+2RLiIMfA79qy4XkdQ3W4pjdp4N6xe8ijmzt9xdfM9wyw017Cammc0KKOHm14zDRggiMc5qQ0tpArnmOfYJjNpsxqH/dOB7QJoiwQ3o9aOS/yX+eql1+7uun0MIXj2olMDVpeJd9apwfTDHhwiTuCvxrTjN0tPRBJ8nyzN7l23j+cBxxyN8nswRJ6wMiB+AHTtKzROgv6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsXDIthQjx5xO+nvjnKloZWxmayyyz5OMdUOQZhTM5I=;
 b=UVbsuDFF2+JcEPTY1iNFds6zjKaXUPskTPTMnv3nWq30dwN994MBF5RNuq9p5xw5uA2zeXnjLcY75ZAJTINiHXaAKri+pGwtJuZIUwTzfFIP46jc6bc4dzZW8p6JmVCyqA48nUU/NzZHAORODoVl9Z8rxDkFPF6QeL21bXrlZzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Apr 2022 10:27:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
Message-ID: <Ymj+c1nmOgbiw/M8@Air-de-Roger>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
 <YmJ4NLuvA63Irow+@Air-de-Roger>
 <24112cfc-0446-d81e-85f1-ebf9da0afe14@gmail.com>
 <YmaeLc2iwxUPUAvF@Air-de-Roger>
 <57bfc576-48d5-9121-a32e-fa00be64d6a9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57bfc576-48d5-9121-a32e-fa00be64d6a9@gmail.com>
X-ClientProxiedBy: LO4P123CA0435.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97323777-dba5-48bd-d403-08da2827c7e1
X-MS-TrafficTypeDiagnostic: SN6PR03MB3613:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR03MB3613A14C49E19766EAD93C948FFA9@SN6PR03MB3613.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tWBwKnRYO0VCzltjuZLNqDUI+dTpWXu7WIw/R1SKtHMylUjQ5KZl+2CB6a35JCo9GLRci2TRLGqcc5z1Y6z/JNi4bXSURPjhMxWNUuV/fX50CbT2/2qofMIJ5aKONLRpApL7gbWh8Y0/Hn+kNnD8Ai95HeQ3fOO2Yk64ggNV0r4bTPnta3njvhG3H7zLz1k8p0G1ja55ZVg1ezzkUDs8C8G1EpnEPh3X1HqcDFSJrF051znhVZT9zBN/ic0UPNrQSHY4R8II6luIZFCQ8lr8RB5OvFSr81Vn6VZ377d+fZwN2efHEP/Juw6wTFBgfLJlq8g3jVFHDaFCtqRQup2Hn39gEqU9KYaqDYj8jQrbN8ke7tBnAew6RXyRc7Lyp8InzpSaOLTLdlTgOZWY9NQ+4fhs+Gk5YO1oTw/Hg6rkTaLJ8zaJw1/p5mFE0/rWHvqN8BQmvzsAZ6JA6A2Q6m9suirFm6BcqPP6bn1tRD+ePThEP+NJge0yRj3wcNPjaP3/rWsY+jb+LRGLlJJHQVPv5Yh2aiDE5kayVHjQyskEtHReTOg74N3pG4hHgN7+Y/VVThyZFTPETHU6frD/t0emHvw98gOyhcLGhXP9Bg1Ergb1cnQ5KlExu9zlyiS2UrWQ8wHmh6ezCu3mluNTlYdYqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(508600001)(186003)(8936002)(53546011)(7416002)(86362001)(33716001)(6512007)(6506007)(26005)(6666004)(9686003)(2906002)(82960400001)(38100700002)(83380400001)(5660300002)(6916009)(316002)(4326008)(8676002)(66476007)(85182001)(66556008)(6486002)(66946007)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk9ZSlBVUnNtUmVqcm1vTW1HMW5MRkdCMHdBeFh4YjJHdHZnVnhlUkVmQWdh?=
 =?utf-8?B?dEViM0pJbHVGRzJnYlVXcXJJMU1WZWttVXVlNW1qRmNCL1NjMUMwVU9IUGNy?=
 =?utf-8?B?WTB2UVRISXFxdXIwY0hPSzNJa1A1dXdJYk5yaWhlT2xtTmlLYWVvTW1XWGt0?=
 =?utf-8?B?R0MwQ2l1dFFFaXgxTHMyd0hIL3VzdEthcmxDQy9MNnRmSDdXTlBSM3M2em1a?=
 =?utf-8?B?U2pqM282dVQvVVhaNmdkZXJ6MzlEeGZQMHdRWGxFclBFYVVNZHM3SWlUMTcy?=
 =?utf-8?B?eGJFT1VVSWNDRE90MTFMZW9wblRsazN2V1diVjdML29SODFzc08weEtBVExs?=
 =?utf-8?B?T3V5dXFqK3JLTGpIcDVneTZUSEMrRkhEZWZjaGlBZnZ4bzZDMjlieCtQQ2VC?=
 =?utf-8?B?TE5zWlVUVC9CZ0YyK1NObjJwUmI0cEhVbjFrTjhpeDY5Q01oSTBWSmNWQWxU?=
 =?utf-8?B?ZU5hN2JxczVCbGFRYXdOOUdkUzB0YmhQTU9IMFpMMzlrQjdiNnBiZWthdGVr?=
 =?utf-8?B?UVZ4Z2tBeFYwendId0hyZHJHT2xRd3pXU0dNc3RlbisveVk0SzArUFBad1RJ?=
 =?utf-8?B?cUNFOWNrT01uYk5QeTRjOEdlUWh6alM5bnJSanAvSGZ1ZWdsbHIvZUloekI2?=
 =?utf-8?B?ZDJRZGZCZXJxVzB4bFllYnJGa3JKZGFJc1g2MmErT2NJYURiL1dkbVZCVm9X?=
 =?utf-8?B?VklDV3grTjdOWUMwWFhCcTFpY241RzRYUTlrZXZIMldLVGFMUEZBeVhVeHpv?=
 =?utf-8?B?OERLS1JqNkRxNlloc01SeHVDK3NJZ1lUTHFlSUwyajhsRXJhc2hlVHQ2NjdE?=
 =?utf-8?B?UlY3eWlmL0JCRFJ5MXpUa2tDNXlNZGJvTTZWOFNGbUdVdnVZY2pDWFZSeHRt?=
 =?utf-8?B?Njlwa2x5S0dsWldwaUx1RlVkcXpUMEYvY1hXU2ViMytORXd5dVlaS3l1RjB4?=
 =?utf-8?B?Y25tb2RaOW9FSkZiUThrdDB4WTA3a2k1WTBQekcrUnF6Mys2bkl0ZWZEdDdU?=
 =?utf-8?B?cllxZ2FOZld5RkJleXVIZnpJSWN1ekR0SlRPSlcvNnhrcmY1TE93emE3MnlU?=
 =?utf-8?B?ZDNHRW8wTDdQWit3ZlVaTCs0cjJQNmNhQmVGTzE4M1NidUJEaGN2TEZKTGVn?=
 =?utf-8?B?MDVZZ0U0a0l0akJWVmFhNnByZ3V3djRLRzNtYmo0WHNWb2RTTlE4WE1pcThF?=
 =?utf-8?B?R28xRVBheCtIQk1vMVR1NGdHUjlvbHRqU1JQb3llazhqVGNZeE5xbFAwQ1Fz?=
 =?utf-8?B?N0lZMENNbEtTYnV3aUtVUlJ0aWtaTGprejhIalUrTjVka1BSaG0wd2JRM0hi?=
 =?utf-8?B?NEFnUFVCa2pPUDNvMDRVekttVkl5bG43Q0M5R2p3MXlxNFAyQWlqc3JiWk1h?=
 =?utf-8?B?Sm1INU53QlJRRUc3MDVqeDErdVFJTG5EbDFSbU9Vajc3UDZPR1QwdnR5RUM0?=
 =?utf-8?B?NWtJVWFHbmU4RWVQazBYSnBheWptV08yWm5EWVdwRW1DcVRMUW1ySm9kbUIw?=
 =?utf-8?B?VnVqWTd1alQ4M3l3bkFYYk9NWExTaXN6R3YrdGtaTWhSZjhDOWl5bWFFTUVh?=
 =?utf-8?B?K0lkd2tqb0JEWW9JcnZJbXlLOTExTlpNWkRMbnEveXMrZVorcThTSytBdjV4?=
 =?utf-8?B?NEtuZ0hFL09VN0t4NERpQktTbFhNMjNzcmR0ZFFNWkVKSUthWk1HdVJacnB2?=
 =?utf-8?B?Tm5XOVFXMDQrbGhHYm1GcjdDTW9ScVlwUFB4WG80YUJKSTRYVkxpZG54RGpE?=
 =?utf-8?B?MjJDYVNBdUd0WFRFVkp3WTNha0lmMmxKdUlWOHI5eXcxMkhFc1JqT04zRzUy?=
 =?utf-8?B?bkpJc2JpcXhkYlRML3NXK2piT2U0Slo0SkdKQ3RUOGUyR0VWVmFHM2lucnhC?=
 =?utf-8?B?ajdzQkF5Q1JXUHpRR2NZR3JBUitBQUU1d0k4UFhJaGF3NW9PUVB4aWhqNkJY?=
 =?utf-8?B?eXY3TndTWjJTOHVnazl1RDBqeDQxVVRkVlBLSlpOaDlCby8weXg2QTcyUnV3?=
 =?utf-8?B?UGhCSnpCOGNNQlQwcHhJL2FrVFIrN3FWYnZDdy9kMjJVK0s3SVorN2RoL21v?=
 =?utf-8?B?c0xGdU5CaDMxY28rUVk5RytwR29JVkE2eDNZc2JpR0tpZzVnL2dtNHk3VWYy?=
 =?utf-8?B?U2lFb3BSVHc3ZUJQV3ZlZDY3Y2tINndvdWNYaWZrTndtMzRKRUNhWjV5L0tW?=
 =?utf-8?B?bExETDRsK1RuR2J5NDdpVlJ3T0QyK1BhS2F2dWNBODhlazZpeTRzRUc2OGhM?=
 =?utf-8?B?b0tPQlorK0tuemlBaHUySWZONitlRVhXQSs5SjRWVGRKeTgyemdJL0dLM0tw?=
 =?utf-8?B?SFhwQUJ3Z3JiVGdlOFNGWTJaaEVKUFAyMEErWjlwQ0puYWFTd2o4bGZrMU53?=
 =?utf-8?Q?dVLNFNwl5jHKmt2I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97323777-dba5-48bd-d403-08da2827c7e1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:27:35.0053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJYKyIxuOyqFF9GnucpTHQ13jesZqj566jSoe4hp7YmmO8vPqcdENtWZ66Cw6+zvNaN0Om0jM10K30WOaaTqRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3613

On Wed, Apr 27, 2022 at 11:20:04AM +0300, Oleksandr wrote:
> 
> On 25.04.22 16:12, Roger Pau Monné wrote:
> 
> 
> Hello Roger
> 
> 
> > On Sat, Apr 23, 2022 at 10:39:14AM +0300, Oleksandr wrote:
> > > On 22.04.22 12:41, Roger Pau Monné wrote:
> > > 
> > > 
> > > Hello Roger
> > > 
> > > > On Fri, Apr 08, 2022 at 09:21:04PM +0300, Oleksandr Tyshchenko wrote:
> > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > --- a/docs/man/xl-disk-configuration.5.pod.in
> > > > > +++ b/docs/man/xl-disk-configuration.5.pod.in
> > > > > @@ -232,7 +232,7 @@ Specifies the backend implementation to use
> > > > >    =item Supported values
> > > > > -phy, qdisk
> > > > > +phy, qdisk, other
> > > > >    =item Mandatory
> > > > > @@ -244,11 +244,13 @@ Automatically determine which backend to use.
> > > > >    =back
> > > > > -This does not affect the guest's view of the device.  It controls
> > > > > -which software implementation of the Xen backend driver is used.
> > > > > +It controls which software implementation of the backend driver is used.
> > > > > +Depending on the "protocol" option this may affect the guest's view
> > > > > +of the device.
> > > > >    Not all backend drivers support all combinations of other options.
> > > > > -For example, "phy" does not support formats other than "raw".
> > > > > +For example, "phy" and "other" do not support formats other than "raw" and
> > > > > +"other" does not support protocols other than "virtio-mmio".
> > > > >    Normally this option should not be specified, in which case libxl will
> > > > >    automatically determine the most suitable backend.
> > > > > @@ -344,8 +346,35 @@ can be used to disable "hole punching" for file based backends which
> > > > >    were intentionally created non-sparse to avoid fragmentation of the
> > > > >    file.
> > > > > +=item B<protocol>=I<PROTOCOL>
> > > > > +
> > > > > +=over 4
> > > > > +
> > > > > +=item Description
> > > > > +
> > > > > +Specifies the communication protocol to use for the chosen "backendtype" option
> > > > > +
> > > > > +=item Supported values
> > > > > +
> > > > > +xen, virtio-mmio
> > > >   From a user PoV, I think it would be better to just select xen or
> > > > virtio here, but not the underlying configuration mechanism used to
> > > > expose the devices to the guest.
> > > I got your point.
> > > 
> > > 
> > > 
> > > > We would likely need to add a different option to select mmio or pci
> > > > then, but that should be set by default based on architecture/guest
> > > > type.  For example on x86 it should default to pci, while on Arm I
> > > > guess it will depend on whether the guest has PCI or not?
> > > > 
> > > > In any case, I think we should offer an option that's selecting
> > > > between xen or virtio protocol, and the way to expose the
> > > > configuration of the device shouldn't need to be explicitly selected
> > > > by the user.
> > > 
> > > ok, for now I will use "xen and virtio" values for the "protocol" option,
> > > then internally toolstack will assume that "virtio" really means
> > > "virtio-mmio".
> > > 
> > > When there is a need to expand that support to "virtio-pci", we will see how
> > > to deal with it from the configuration PoV, probably like you suggested
> > > above by adding another option (e.g. "transport") with default values based
> > > on the architecture/guest type.
> > I think this likely also wants to be a separate field in libxl_device_disk,
> > which could be left empty and libxl will attempt to set a default.
> > For example have the following in libxl_types.idl:
> > 
> > libxl_device_protocol = Enumeration("device_protocol", [
> >      (0, "UNKNOWN"),
> >      (1, "XEN"),
> >      (2, "VIRTIO"),
> >      ])
> > 
> > libxl_device_configuration = Enumeration("device_configuration", [
> >      (0, "UNKNOWN"),
> >      (1, "XENBUS"),
> >      (2, "MMIO"),
> >      ])
> > 
> > libxl_device_disk = Struct("device_disk", [
> >      ("protocol", libxl_device_protocol),
> >      ("configuration", libxl_device_configuration),
> >      ])
> > 
> > I don't like libxl_device_configuration much, I think is too generic,
> > but I can't think of anything better.  Maybe others can provide better
> > names.
> 
> 
> Here [1] we had a discussion regarding user configuration options.
> "protocol" cannot be used as it will lead to the confusion (at least with
> Xen PV block device which already has "protocol" frontend's entry in
> Xenstore).
> 
> Preliminary, we had agreed on the following names:
> 1. specification: xen or virtio
> 2. transport: mmio or pci
> 
> Please tell me, are you OK with them?

Yes, that's fine. My main point is that libxl_device_disk should
contain both fields, so a 3rd party toolstack can set 'specification =
virtio' and let Xen decide the transport to use.

I'm dubious whether we want to have a xenbus transport for xen
specification to use, but I guess it's fine to say that for
specification == xen transport is ignored.

Thanks, Roger.

