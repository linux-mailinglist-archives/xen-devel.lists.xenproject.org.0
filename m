Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F8C444447
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 16:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220967.382443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHqb-0001xg-L6; Wed, 03 Nov 2021 15:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220967.382443; Wed, 03 Nov 2021 15:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHqb-0001v8-Hb; Wed, 03 Nov 2021 15:06:41 +0000
Received: by outflank-mailman (input) for mailman id 220967;
 Wed, 03 Nov 2021 15:06:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+yV=PW=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1miHqa-0001v2-HO
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:06:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a397e174-3cb7-11ec-9787-a32c541c8605;
 Wed, 03 Nov 2021 16:06:38 +0100 (CET)
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
X-Inumbo-ID: a397e174-3cb7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635951998;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hdQxDsnPDf3X9UufOjqNA50woilmgDCN6OIIwKWVSzg=;
  b=V9RCoWWgfTxyUvXnEjz5pBQSADoXMaI9WyyJVKyrMWfOrh5Zf6LabsmF
   HUD8W4GhWhdXDT+YRVfzh+cmG7Ckh5Q6Z5ShHvRX5ArmgtU0xETcPJFsG
   p30Wa02zC4pm2uAUNKSbTAh6OeRsmVZavB4NX+P9hNv5JlhF2F5aXHVKV
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: q/Gse6JdY/NaniAM0Mv72YF1iRrhdM/zG+2JX8acIs4YXkNGeMw3wQwrXLS7KyUYPpAI5OGowV
 pDjZlq9l2Rme+h8vSXHdkUIwHyKlhUjGHqZJOuS5LHbnJpBD4bSlVuCSAx24NfIbWCsraPkxna
 r1y1itW4PzA2/NluzO6D6C8LDkgxvMq/zEzzOSj7cmHh4SUMQ9qkRyRh1DCxvfBN28D4rJXOOj
 iIT2+G5YdcqrNvmY5tQX4bfvK4OEeWAtO8tD3+VFyGsX+L14PuwjKZbg4bPNYpoee6GzkEKdiA
 Ba0L2s26b1Jk1DdeS4AyRsyB
X-SBRS: 5.1
X-MesageID: 56990139
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tLIujKOUxv2i5tnvrR1JkMFynXyQoLVcMsEvi/4bfWQNrUok3zMEy
 jNNUGHQPvuMZ2Omfdh/bo+19UoB6sfVyddjHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eo4w7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYowuuwNR79
 /hIj52peCEVJKDrtOQ3DSANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iUtI4AhWxh7ixINe+BS
 fojUxR2UAvBWgFoZUkRK4Jig+j90xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiXcxImm6Iq
 2SA+H72ajkYPtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUEz16JwJX55jyYH1kiciRMT/AmnpEPEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQGmom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CHsp6sz67DFzFtW
 UTofeDEsoji6rnXxUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJ1ZKWC5P
 heJ5VMOjHO2AJdMRfUpC25WI59ypZUM6Py/DqyEBjawSsEpHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZIcQtRdShnXsurwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg9AF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:4/zXaaMQiFimf8BcTvujsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICO8qTNWftWLdyQiVxe9ZnOzf6gylNyri9vNMkY
 dMGpIObuEY1GIK6PoSNjPId+od/A==
X-IronPort-AV: E=Sophos;i="5.87,206,1631592000"; 
   d="scan'208";a="56990139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YW1j6RdE4LLzEmJ7HaBUCMIutVSmHhywLu3QpRXpEcZnl2IWkIxfWgKBZlZ8mwT2UvMkK8V+MPUmkfQVVRTxE8aqSs0aSzVHmOm52SbNUzjInqqimn8sAHpcW0C+I0DHsM9W10lAJ6RFmPOAdILxiIxNHw1EwEtqIbPeSWANVjXayZrIAh2jWcVDu0HQcUlcfrIfgvGbitZDSao3ArBu/fZ2YW6oUYiMvgR61DLsVJ5u1NpwOpo9l3vHUTHCYgk/yjj1hEdQ+++imAHKMjUUWjF28USOPwwcfHarOQre9/BdThu7XEluqlSotYzFdRbv5e1Q901icxu/RsIGezqa/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aL6lTGv6E9eqpavSlVAGx7/HH4bk1n+Bu4962vKDwE=;
 b=ZET3/9D9nbDWfkmTbHxjXiQpy05FuWWvPcbNGgOlrvk0n2IvVlIiz6fMnilsMxJnnvoZ8gdFrNr5qahzVJuuuxZNQmW/Uhf6MNTBtHCoZbrl6Eh+uGX/5ze4GXyGs58siphfZZl20TC19239jabfXqiz+Drk2/YQmY7Oa1o8BT8BqzOfYNDtdhXBdplLJ/hEZp/E/qEB7/QYzSyDteY2KIzY3UTLFCNIoL3w/WfBOydtupnOZk+LfXDGqGIrgmXAKafUUPZHB0Aj/e304OT0XgkbqsXEN5437LKplME15mIT/wtXqcgIK8sgGFquKjxQHkjXL/i5E0/zVQATTHyPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aL6lTGv6E9eqpavSlVAGx7/HH4bk1n+Bu4962vKDwE=;
 b=XU7Dw6v6F7kJjFVla/zNB76vcdNBB0zCd79VSKRPDilT2c2fmXEJcw5Z+SdtB+kL32Apcp+woI6wcV3CLkrb2qv6DnmvOiYnv44rYq9KQ/arLXig+lDvQM5LTmcssqNWXoKCy3cyc31/xfY1XseH9HPc383jrxeoGKHXiaa8JQI=
Date: Wed, 3 Nov 2021 16:06:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 3/3] AMD/IOMMU: iommu_enable vs iommu_intremap
Message-ID: <YYKldeiym0fLWTsa@Air-de-Roger>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <ff7b68b2-5bba-2927-e3f0-f3062862c466@suse.com>
 <YXaGxX3J1aB39mSG@MacBook-Air-de-Roger.local>
 <dd2929fc-dc1a-1c16-5954-6894766d9dda@suse.com>
 <YYEa6HQGR1cHJBw/@Air-de-Roger>
 <bcaf1547-98ae-923f-5be8-50156e318bf4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bcaf1547-98ae-923f-5be8-50156e318bf4@suse.com>
X-ClientProxiedBy: MR1P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61b9f750-6644-4242-1fd2-08d99edb85cd
X-MS-TrafficTypeDiagnostic: DM6PR03MB4841:
X-Microsoft-Antispam-PRVS: <DM6PR03MB48417E1A78B7C6C648832A6B8F8C9@DM6PR03MB4841.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h8dAJ+o+jgsApUrSgGIcFZ+ShJEAqBoke2YmL+FDBD8xLB77GegkJ/q/nslIo1/tQ5KKhidyjWP0YES7o1XuPxpCFEHT2Rcr5aw4PsSXvMuyCO70mb7hMNucMC19GtLfCxUOBrcep1x/SiF7QRrimTUhNT2Pk+w8PvXbBT9H8G6q7KjmzxxD0Z5RYPv2BHQIhpwhg2BxATY85V8R6PxmVUiyYJKYxmvDGTw3IaKI/EWXnVTvdp5tUraZgMUu44KRFljLd/IQPN2zqLBeEk3fE/9zmpyYQmKJJNpJ9gU3rnos7gX4cCic5ch27G9Vt4dQJx69q1Lr02zg8YJ/HxTtrS0dbKf758GP0MJ/rgv4klEAPrLwznysqf1i5KvpwaXEUjx4G/gtQ98c7iSuZ8TO/jpANWyx0MNFgk3rxXEPf1It7iAC1TZhyFl9XYRR4iB0URqNJG66Mz7FiFXHV8iNDOd1MTBKUx50mgudFBs9TVKnlOodYvwJ7N2rTIMubda+xkB0NEFMVpd+pWkbnb1JkKSx0OGkR05RH7lWBD4MFJdbr3CNJfnM/+zummZxy2Lnji9E2qvK6Hy/T/LzvpRr+HgXBqk0P3oQ5UstrqWNuc9NPakp2onO8CSrn8AlzdXse31Cr1lZSq9vq/4z2OUz8A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(33716001)(6916009)(66946007)(54906003)(2906002)(83380400001)(316002)(86362001)(4326008)(82960400001)(85182001)(956004)(66556008)(8676002)(66476007)(38100700002)(9686003)(6486002)(6666004)(508600001)(8936002)(6496006)(186003)(26005)(53546011)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFZnMHJVMWxYRzR0U1NVTS9POENtU1I5WTNyVWQ5Q0tJeGRxbDhxaWl5M1Zh?=
 =?utf-8?B?dkZub3ZUNzArM3g0SmlyUzZSZ3c4QjV6VmhoamJyR1AzTkNZSEtCOU1wSDVD?=
 =?utf-8?B?VWx1eTRnUXF2amluZG92VVArVS9TTlFWdkMwczBUZ3kvc0ltMEpBSkgvekZW?=
 =?utf-8?B?eGFpeWl4OUFrdEhHbWlCMXhmc21qRFJjSlFxbWlwVGd1UE55WGd0Sk5GWk9k?=
 =?utf-8?B?YmZreE1GS0hXdUpzTFJPdDhvdzdlNjZ1WkxDcXJZTW95cjJIV3A3MDI1SW5q?=
 =?utf-8?B?VXp4WUpqNytYZSsraVp2S3ZqVHRXajNtMjR4TUtPL3FVYUdRbjRSOUdZQjBI?=
 =?utf-8?B?V0xmZWc0UUNBNzZuSTBRUXc4VXlPSzhMM252YVd0MndHaDFMakxKUVVOcmpP?=
 =?utf-8?B?cXJtNkRhcFc4SlE0L3pWL1QwQURiMWwvYUpaUTNDTEpZTlUyQkFabWc4UkZ6?=
 =?utf-8?B?bk9CMVhqYklrSzNDaXR5OHdra1J4bm0rWTRqUVhBU203UkJhNFI2TkRPZEFQ?=
 =?utf-8?B?RUVLdnNrY3NFTG1CbW5oWXFhVVdjN0c3elQyZDY3am8yT2U2MEpLTEZXNGV4?=
 =?utf-8?B?UDd6TjdQUzQ0RlF0eGQ0N2lYR2Y0TXZZUjZJcVBEZkJ4R3EwT0c3T21hVTNx?=
 =?utf-8?B?ZnU0NmpTWFdDNUV6eXYrbmd5TUlJOURnTjFnWG5EWXJ4TTZGZEtmbXdRWTVQ?=
 =?utf-8?B?eElhUnBiSEtkRVh0YWdkcHA3Wmc5bnp5czVTa3IxNWxrbFFISmorTE9wY0RD?=
 =?utf-8?B?cmtnd1V3OTNmb0pNQlZod3l3WHNxYWh4L1FabXJ1ZjE1NnJ0VzR6NzZlSGJX?=
 =?utf-8?B?K1oyTnY3ZDVpdVRPQnd1SUdyVWRXU1FsY0ZPc2pNWmlxbVBiSUVmdGZUQTNP?=
 =?utf-8?B?bDFweENQZyt6Q0FrS3V1T2tqMlJoblEzMFE2eWZRQnZmcFA4TVNXZURQZFRj?=
 =?utf-8?B?OEhKbzg3WGI4MlIxSWx0c0tXTmFYdXdIakZXRTlRV0xmOVdnbmFQWjRRM0Q2?=
 =?utf-8?B?R1U4TC9pR1AwejcwOFJ0NzlJQXlDaXJzUjd4ZHc5eXJ1cFlFSUMrVi9vOStv?=
 =?utf-8?B?TU9wTmxldWdvTDZPNjlqZ3grWm1XTzAveG55Um9vWjVFNUc5U3ZCUWxKbGNs?=
 =?utf-8?B?NjJLYzRqenpLSWQ2bzQvOVNrbjlSZTVoMnlCMmo4Sk9EQjBIQ1hzSE8xcVBo?=
 =?utf-8?B?NVM5R0ZkelUvdWF3N3FBNUlGNjZITE16UjI2Wk9qcXFJZkF3RkJIUnV2aDBY?=
 =?utf-8?B?SEtpK25FcDNwRnZGTlFsK3pIOUl0Z2ZIbTlnR3FLaXEwcmlRZ0dWVTBSdnNr?=
 =?utf-8?B?b3kyTXFCTmVmcnRUU3Z2WUYwbzFHQlNYTXlPQlVpbWh4US85cjZmakFQR0dp?=
 =?utf-8?B?bVN0K0NoQUZxSG5FaGUzMFp4VjUzcktkVkYvZGxOMXR3eWFuUmxsbnRmTGg5?=
 =?utf-8?B?enpNT2p3b3V6UFRnOU83aE9qb0tnamk4RDZWekpNanlPQ3dvWXllQlJNUXhy?=
 =?utf-8?B?S2JUbjRjcnN6Y1RYMkNGMUljdkVBVHpFRHIybjljT212Mm1NQWdpSEtvS3Fq?=
 =?utf-8?B?MHdzcW5IaGpyVnFEV0s5QTAzK0FpM0Z6MjVucFg5ZmtOWWtwQWtQUXoxL0VL?=
 =?utf-8?B?SmxWQ3E1RGpJenBiUDhiSU1zUVJVWi92RkNmUG1FbkhBZU1PdWlyRTJmUSty?=
 =?utf-8?B?UW9oYXJwMk9vMEZxNTg1cnJERHNNQnFMTUZOWHUyY1lwdXN4WnNFLzVieitR?=
 =?utf-8?B?NEdqTjRnMVpHeDcwa3g0TGlHU3dJSy92KzM3bVhlYkhXL3hxNGphQTVFK1Rt?=
 =?utf-8?B?RDBUUDIzSlViRlo4MmRVS2lVbldvOXlnVFBDNENoUm9MWTA2YUFZa0ppTkVR?=
 =?utf-8?B?YXRvaUI2ZEV0RnNxN3V5a3VkYm95M2d6MzZ3OVZFS3hhSnZpZVRxVUpYRXVR?=
 =?utf-8?B?Y0RNZFdoUmxGTkhpWit2Yld2R2VWMm5qU1lmZG1TWjV4QXRCL1JpWXJPSTVJ?=
 =?utf-8?B?UEg0Wi9XbUI4MTZjR3R1V0FTdEdLZnhSU1pLQ2lrOTR0ZllzZlhHbzJ6bEp0?=
 =?utf-8?B?b3dlK0R6VjZlSTRHYnI4ZmYwM1JUQlhLRkJOVzNkQmVOVkZNS0t1YkxKODVs?=
 =?utf-8?B?M3VFQ0NMS2E0SmNvOGpVMEVTalZGSDNxU2hwYzVZWUhXUE5MN0dBME5hMHJw?=
 =?utf-8?Q?wnFIGJtPGAKAadlt3CkJi+g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b9f750-6644-4242-1fd2-08d99edb85cd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:06:33.0898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JcWbROg88INHmnfYobbxJf/ntMmZxi57VH8Di+/STCxoXGBdqpWeMF3Zj4Mm2cPVyndmfue0qM+HmXJXCUIDMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4841
X-OriginatorOrg: citrix.com

On Wed, Nov 03, 2021 at 10:46:40AM +0100, Jan Beulich wrote:
> On 02.11.2021 12:03, Roger Pau Monné wrote:
> > On Tue, Nov 02, 2021 at 11:13:08AM +0100, Jan Beulich wrote:
> >> On 25.10.2021 12:28, Roger Pau Monné wrote:
> >>> On Thu, Oct 21, 2021 at 11:59:02AM +0200, Jan Beulich wrote:
> >>>> The two are really meant to be independent settings; iov_supports_xt()
> >>>> using || instead of && was simply wrong. The corrected check is,
> >>>> however, redundant, just like the (correct) one in iov_detect(): These
> >>>> hook functions are unreachable without acpi_ivrs_init() installing the
> >>>> iommu_init_ops pointer, which it does only upon success. (Unlike for
> >>>> VT-d there is no late clearing of iommu_enable due to quirks, and any
> >>>> possible clearing of iommu_intremap happens only after iov_supports_xt()
> >>>> has run.)
> >>>>
> >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> In fact in iov_detect() it could be iommu_enable alone which gets
> >>>> checked, but this felt overly aggressive to me. Instead I'm getting the
> >>>> impression that the function may wrongly not get called when "iommu=off"
> >>>> but interrupt remapping is in use: We'd not get the interrupt handler
> >>>> installed, and hence interrupt remapping related events would never get
> >>>> reported. (Same on VT-d, FTAOD.)
> >>>
> >>> I've spend a non-trivial amount of time looking into this before
> >>> reading this note. AFAICT you could set iommu=off and still get x2APIC
> >>> enabled and relying on interrupt remapping.
> >>
> >> Right, contrary to ...
> >>
> >>>> For iov_supports_xt() the question is whether, like VT-d's
> >>>> intel_iommu_supports_eim(), it shouldn't rather check iommu_intremap
> >>>> alone (in which case it would need to remain a check rather than getting
> >>>> converted to ASSERT()).
> >>>
> >>> Hm, no, I don't think so. I think iommu_enable should take precedence
> >>> over iommu_intremap, and having iommu_enable == false should force
> >>> interrupt remapping to be reported as disabled. Note that disabling it
> >>> in iommu_setup is too late, as the APIC initialization will have
> >>> already taken place.
> >>>
> >>> It's my reading of the command line parameter documentation that
> >>> setting iommu=off should disable all usage of the IOMMU, and that
> >>> includes the interrupt remapping support (ie: a user should not need
> >>> to set iommu=off,no-intremap)
> >>
> >> ... that documentation. But I think it's the documentation that
> >> wants fixing, such that iommu=off really only control DMA remap.
> > 
> > IMO I think it's confusing to have sub-options that could be enabled
> > when you set the global one to off. I would expect `iommu=off` to
> > disable all the iommu related options, and I think it's fair for
> > people to expect that behavior.
> 
> It occurs to me that this reply of yours here contradicts your R-b
> on patch 1, in particular with its revision log saying:
> 
> v2: Treat iommu_enable and iommu_intremap as separate options.

Right, I see. patch 1 uses

if ( !iommu_enable && !iommu_intremap )
    return;

Which I think should be:

if ( !iommu_enable )
    return;

Sorry I didn't realize in that context. I think we need to decide
whether we want to fix the documentation to match the code, or whether
we should fix the code to match the documentation.

My preference would be for the latter, because I think the resulting
interface would be clearer. That will require introducing a new
dmaremap iommu suboption, but again I think this will result in a
better interface overall.

Thanks, Roger.

