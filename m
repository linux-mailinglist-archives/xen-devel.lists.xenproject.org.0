Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EA37182F1
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 15:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541821.844981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4M9a-0004sC-OK; Wed, 31 May 2023 13:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541821.844981; Wed, 31 May 2023 13:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4M9a-0004oh-KT; Wed, 31 May 2023 13:46:18 +0000
Received: by outflank-mailman (input) for mailman id 541821;
 Wed, 31 May 2023 13:46:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EXUc=BU=citrix.com=prvs=508c705fb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q4M9Y-0004TE-V8
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 13:46:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81c56718-ffb9-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 15:46:14 +0200 (CEST)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 09:46:05 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB7051.namprd03.prod.outlook.com (2603:10b6:a03:4d7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Wed, 31 May
 2023 13:46:03 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6433.024; Wed, 31 May 2023
 13:46:03 +0000
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
X-Inumbo-ID: 81c56718-ffb9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685540774;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UsOz6eHwm9u5f1bygqhZApqE9ooH5hTMjSD4zWvwnco=;
  b=VksHwadWTYB5vqGRYkmhC3lXo87zw/w2V+Qwf1a6aNUpetEo3pIfZmJt
   c/EB4tPG2SgTi5YARGU3kZfK7MMPlOh5M9NN/7q4/W3JOn7xaLn6Cy5BB
   3EzBe6qt+FHGivOCKKZi0tcMwp8QvtL8KKLdp+SiBazWXieVcMMAUluoT
   s=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 113564348
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:E3YX06OQ2GqI00DvrR1rlsFynXyQoLVcMsEvi/4bfWQNrUokg2NUm
 GFJDD2FOPiIM2v2edB/YYvgoRsC756EzdVlSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tF5QVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sZIUWxn9
 NkHFDAQNhW9jMCI37SRUeY506zPLOGzVG8ekldJ6GiASNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxujeLpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyv327GTxn+rMG4UPJ2a++5jvHiu/2EsCw80agXludmEuFHrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBByFrsbCTYWKQ8PGTtzzaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLOLGxps34H3f32
 T/ikcQlr7AajMpO26Dl+1nC2muovsKQEVZz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6zt3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:s98FPq0TkkzbMicZ62L5qQqjBLwkLtp133Aq2lEZdPU1SKClfq
 WV98jzuiWatN98Yh8dcLK7WJVoMEm8yXcd2+B4V9qftWLdyQiVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7/rH3A==
X-Talos-CUID: 9a23:E3HsbmwfEUGcBvE3HC+sBgU0JZAoW3z400vQPhe9N21LdqKTY0SfrfY=
X-Talos-MUID: 9a23:OM/6UAsm6qPCPq1Lt82npBNvJM5UxpmXBX8Og7c55ZecFRFCJGLI
X-IronPort-AV: E=Sophos;i="6.00,207,1681185600"; 
   d="scan'208";a="113564348"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmVV+SjZt+v6kp5fTFA7PuOxCaX34A7MMYaoJfL/yzzxQX+9cj2mbPMKSlqi5tT1TPqg9AmgHINxHGOy0VjsXOPkjIVqYvQtzRGAqH02xH58PyVDagZppMlR20KkbUEFQDluHyzxq6YDUbbrkysr+wpN8aDaanO7a8SqKA/4lyYFUBmOc74P/1fo3UzJcRvJD0Hb0XXsvHI7hdY+YLXKGgGfMMuD6aKYw0Wb8xNhK+hZzO+49c18yz//u7CAhxCZgAWOANwl+Y4GCQ0bBLYNrZtpL0776lwqFA7ZIRC3fMobqId8+2+jqxVua2vj91bzUJPuSEET5NxyZPaa6aQEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsOz6eHwm9u5f1bygqhZApqE9ooH5hTMjSD4zWvwnco=;
 b=gpYyXSszSzpHWQUC4U++zz5upCUxD9OXdgoW3OluDF1RRyo23vJS5aQyTRu6rE1EWCW5/fRJ6gY/yGyoUWm7JqUt/QKXjgI/N23XjT58834PW3A/3NKLeCFnll+JjbbxC5AzEv4SplH9KRIKxyj6Z3lrolYtkeU7puzJzrOrgoeFMAnQqRsBODiA4V+hYd6w3mVj/J6p4AyHP4FrSuhzaa4uoN7P4KL/nDZo+ktDckrCxn0NJr0NZ16hrqx3HFtyyaDhmk15PvwR7acMXj2nr5nbRse5J34yzTQ76bHa+GiuZhdRpHh6EM58qN9di8CBCDmcJlDkX/0uVfkz3THZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsOz6eHwm9u5f1bygqhZApqE9ooH5hTMjSD4zWvwnco=;
 b=tcgIszeGC9SXK/moHFtKQZYnTAimap5YXUQJnVunleFTErMokbEPeqmUnVnIHx77RFPLY2/J5iQGnCgkKK/+uDzJS6SEvKTpRW3NvGrpCUYymfXc+5EjvG3VEv7wBl461X8+/y2/SbIWkvSzNf0M5bUHg8APl2IqhrzfQy7mrVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 31 May 2023 15:45:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/2] vPCI: add test harness entry to ./MAINTAINERS
Message-ID: <ZHdPlJYzH2KX1ljG@Air-de-Roger>
References: <bb1bfe6c-eef6-5552-78e4-bdec8fd43561@suse.com>
 <87171ea8-16b0-6284-c4c0-bf0d74fcfc9b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87171ea8-16b0-6284-c4c0-bf0d74fcfc9b@suse.com>
X-ClientProxiedBy: LO2P265CA0366.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 505edf4c-2df3-4b38-0a79-08db61dd5ffe
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	riDxb4l/DbF+aeqvU2UJOKEI40pYPuFcBuP0i08Fk1CEsSoRM65G0vSVSe6OTslY1+GFAtDPlRxyNSnCll55qqp6p1tLfRakI2abNzadg3+RzOAuTj1QRMHjfE/O/6l7EUnF0/j/QDOavRaKMGs0a8RwZponViwsOfHfeseydN9WBy6vgY1QT8PrSGWfS1shcB2f6+aR0mgjdl5QB6JpydBjqpIs/LCwi1F9LYamZZ37FV2vX9msLkoMh/q37tkGzPFtITrgYzTngSwE309YEXn5mhIBA/5jbHJeoI0Gb7heyH8mFxEm3khaAyu5M8/T4IuoCX2z5Z5GCXqVCNKe/6fQH/EfxSmAxc1i7XoOyAMeBuZiqaKPTEPctta4bmnUN846KpE0mN26CstnDSRfcBckNXsBqBFZ1bLSCy1HVFAH4cbaVWM+6txpMl4xrLSa5c2uSZphtGrzYRvg3bOBBG31fdiMOisEhz3nGoqJHzbpvGu4R/vcgJGtziIv5XWi/yuJXYUA7UPUGVmwKxB1O7DIQezk6JGrsdTrmkWTH5O3apRetn4jGrXNBe8Gncly
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199021)(6506007)(6666004)(6512007)(26005)(316002)(9686003)(82960400001)(66556008)(66476007)(66946007)(6916009)(4326008)(38100700002)(558084003)(5660300002)(8676002)(6486002)(33716001)(41300700001)(8936002)(107886003)(86362001)(478600001)(54906003)(186003)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDE4d1g5eUh1ZHhFYzVhS3paUmsvYTZ6bzFzWmVnM3lHTHM1Sk0rbXNSVmJa?=
 =?utf-8?B?d1I2ZWJOenFldjlwaWVPUVBkY04yVnRUeHcyNEJjTnQyV1E2T080Y0xUdWhh?=
 =?utf-8?B?TU9SYm5CdGNkcTZPY21JcnMzalo3WklkekpKREh5dTQrNzRMOHUzbEh1cDNl?=
 =?utf-8?B?eDN1M0dUSnZjWHM5cW5Xc3Z4RTJvTS9uYm0zc21SazZXcTh2d2ZhQitxK2d6?=
 =?utf-8?B?d3pta0hFc21pUDVnRzM0RkVTcVhBWU04Y1U0NzNjRW5kN2ZPbUdIeHcxMTVh?=
 =?utf-8?B?VjB6L1daOGxuVXZkYUFLeFhiVldaWm5VYUptZlRRajRoanNXL284VUhyRzFF?=
 =?utf-8?B?NTRYYXdkQXl4Q3JUL2U5SUpaMSt2cVErc05UalJSdy9DVHB4L3FsUVNFOHYz?=
 =?utf-8?B?QXJBdUhvV2swbTE5cTIxb1RnWnZXZHd5RHQrWjFnbUdTdnNBV2NXUE9aWnJH?=
 =?utf-8?B?bmdkWS81alNhSnY1Tk82Q2VkRE5UcGFERjY0d1cvRUhKSndEQ0E5blVQVHpO?=
 =?utf-8?B?TFhpdFZ2Q0ppMDhabG9NaTVCTU5BZCtFcDd5N2lmTi9oZ2MrYjJyam1pb0t4?=
 =?utf-8?B?ckhvWVdPZ3RsLzN3M2JjdkpaTTFXSE9ST1lCWk9jeXpONk41cFF0MjE5MFJn?=
 =?utf-8?B?L05FTWd4RzZ0YmN2dTZYWFRlSU9vYkxMSUszdWtYT0hlS2RSYnhzN2pPTEhI?=
 =?utf-8?B?WDA3OHZ1M1p4U2pyMnNPWnE3NEZsaGQ4eWhyL0lnZUhtSU5IakZMYVhIVFlX?=
 =?utf-8?B?MVRMc29RY3FIYU9IWVlqcWxUV2dJaEU4cmpOZlhkdXNYSksvN3BjSCtRNktv?=
 =?utf-8?B?Q0FnV2pOMXRCS1U2ZHFIdlgwY2N6K1BDY0lISjZlMGxMU3FUclZHUExWbTlZ?=
 =?utf-8?B?bWVhK2d4aXFxV1ZraVAybVExT0I3Y240VTFSWUJVUUx5bXNDVVlaeFJDL01F?=
 =?utf-8?B?a0cvSDFyaVBoVjlXeU9Pb201a1JjdkRIa3ljWUEyNFdHV3JOQ0Zud3hrTFI4?=
 =?utf-8?B?N2xhRktaemJYdE9JLzZyTVVuNi9TMkVPMkV5R3QwcEhXQ2xyOTZoN3RuVm9a?=
 =?utf-8?B?akVvL2xBTnhQK1VYOFhWZjhGUGZkZkNXVGc3ekd4b1VJdk44bWZaeUZZejVC?=
 =?utf-8?B?bWp6UW84Z09JTW00NENBZnhiUkUvYVdiWDJBU3BRSWl6N3VoWXZFdTFJRkRP?=
 =?utf-8?B?S00vSlUwWFdTMWdsK1F0YUtxOUxwNVR4NjhEVXluSzJ6M3F2bWliZ0IreTVs?=
 =?utf-8?B?a2tETGxDZVVQcDYvSmRocExFYm1VenlIVEZlOTlLeFNsa29wTkRwVGxncVB4?=
 =?utf-8?B?Z3JieFhQT2twRVBnOHVLZlFJVVhLQnBkYWs1N0JiV29zVW1iTGpKcS9FRUR0?=
 =?utf-8?B?eElWY24vcDVsc0hGL1l4M2lpbkQ3SWZNd2xHOEkzL0dvcFRUY2tVWnRBb0dP?=
 =?utf-8?B?eC82MEFMcUVYanZZNVVFdGx6TDAzRFlBMkRVK2FUS0hSNWZlTVBaa2NLbGtr?=
 =?utf-8?B?T1hmd3lJbmgxL3k4L2lXNHZZNTNRMnFjY3Y2MWtFNVkwbXhKZFM2ay9qdkd0?=
 =?utf-8?B?WXE4M1NjUmk1Rlh5WTd1WnJBZTBmdmxNV1ZTN0dnamZZZ0J5YW9uOUFGN0xp?=
 =?utf-8?B?UGkvc0U5VkhmNUxhUDlVUTMxbFFJSkdGVDJWaXF3VlVvSjVSTTVFOEpickYz?=
 =?utf-8?B?RTFaNkNRWENCWXFMMWZPVEw5ZUNNR3dScnQ3WjZza2xqenlvWjF2V2d2SHUz?=
 =?utf-8?B?WDV2VWs3S082MlduaS91anRUU0Q1UkoxZXR6c2IxVzdjM1pZWkJiL3RHYVRi?=
 =?utf-8?B?R1R0VFRlaU1QeGNhZlNDRVNlY1VoOGlEdDNuK1p1NDJHczJ0ZFFYc0I4VUhn?=
 =?utf-8?B?QWZlT29WUVhkY1hlMk1sakN1bGZPVXRHcW1ZWm1RR3hGK082Uktvck1mSFM3?=
 =?utf-8?B?VHNsN3k5OFFMaFBleWE5b3dMeXA0b091dmhZYU9NNFR5WmRIbzBCbTFsM210?=
 =?utf-8?B?cWQyTTl0aGx2TUMwOHl6U3U5cHVEYldVT25jTVY2UEJ0dys2anovanhWWFc2?=
 =?utf-8?B?YWNwT0tEM2JMb0NyT1A3WjZKSzBoOUE3ZHg1UmVzTGFYK1ZzbVJmQXJ3c2xj?=
 =?utf-8?Q?tn89Kil2eT7i9+WKvxP6EvzrT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CXdvq9GVoMNUeiI1z0YkH9Q4OoWqgC2pT5/J7CxLaXJL7CHuHRjsk3I9BxkNXGwwZUxmC8MXNVCZD4Qfid60pZm1xmozhfLn7cIlthRRuLq8z7ixfwJCmQIxALUCO79UqvEOTJt2BMkR1/Qj3WjFqAZ4vrOk7JcXU+1912ZSZ8dnAaz1LXlxBU0KtJuvkqS9AfjcBHh8nkZVjMDMbXtUcKq3Uvip0vKWVqLn1r+jYOYXw3GqzTJVRAsvEO9XTUX8GuJFBlzxkf3jBD9npaxA/Jy0Zf0gwjIs1+9LpSGFd3xgWCkAhIH7Qm4MCDPaHcaRX3pgic5m238a5vgEMTEqW6O0qoMq6yBqY9TMaNdVt8wcUIpJnl5fKSaEq8tg6gBGgM46UgJQj+ORPG2oPinAg22W1QvAYWaa/zEtz+5G/pqSFqZflaDhP2UA6jdu6+X1AKwnigKZw26ZzkfMFfRqmiEFh8AZxtQP96u9h6QONCNztSgRPgki4EUQjne1cDxEOUwl3iWO4eIl/lp86WVuVQyR6o8BWwq3VG/wsktqcno7FycCN6zgbQ6Ywf8MsPHS+5bOj2hkkzu0pZviNB7pDbpYr2PaF6lcCkh5Ud23OrgnTaVmDnpyDahFlSiFvHGiZ0cwUw+QibR3Xt0ze97dW5q4B9KG9/2nFw7eHH8h8WJsyg2g/ed6DkWEd9eLz9AA6IHMjT+Ob/2/Q5JfcRsXXhVMUPlCZrpX8zpXzgWplS+R9EFgJihBNU63JbflgAq6NBxUB6R/GQuWjRgsOlK9FYulVHdR8zcKoGF/UIdrfqNxB7opUnoBXQnPdt5d6AgSwwbwBpS3pxzfchD2GvIjL1euqCIt3dA1W9vEoD/v0C8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505edf4c-2df3-4b38-0a79-08db61dd5ffe
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 13:46:03.0836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoF9ATaTvtcpx0i5BwchtNhr/U699YjIbzpqTFHmN2liNcMroHH2DvTSV6beeLGW/jKbVCgKAZPV7hDigiTP2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7051

On Wed, May 31, 2023 at 03:19:31PM +0200, Jan Beulich wrote:
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

