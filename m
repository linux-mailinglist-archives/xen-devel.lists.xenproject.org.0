Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D12BF54DE78
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 11:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350506.576869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1mBC-0001Zm-K9; Thu, 16 Jun 2022 09:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350506.576869; Thu, 16 Jun 2022 09:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1mBC-0001XM-HP; Thu, 16 Jun 2022 09:52:46 +0000
Received: by outflank-mailman (input) for mailman id 350506;
 Thu, 16 Jun 2022 09:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOxQ=WX=citrix.com=prvs=1593354c1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o1mBB-0001XG-4Y
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 09:52:45 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f2898aa-ed5a-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 11:52:42 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2022 05:52:39 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH7PR03MB6995.namprd03.prod.outlook.com (2603:10b6:510:12f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 09:52:36 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 09:52:36 +0000
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
X-Inumbo-ID: 0f2898aa-ed5a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655373162;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8hUT8+fg06I4pNd13c1QGFVdRMz3TisZWZGcyL2tA2A=;
  b=eYnL9N5JFFDMyAciOyzEmeZgi9evcAuifbDqm6BpLsQN/T9ksRzslQSF
   bUI9/bG68x/RU9a0jyOGAFnzJRLTIFtKhWK/75R51h2WcFFqcj2NIA2cm
   fyJG/UJXK9XSHcyyXUqi9FLJsp1iKeilTOl4pYZUxfyioXesEwJv8hloO
   A=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 74160832
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HIfUX6OgVTCeUarvrR2hlsFynXyQoLVcMsEvi/4bfWQNrUoj0TAAn
 WEbXWnUO67ZNmf9c9t1b47k9ElV6sKBmNE2HQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZn29Aw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 skT6qWJGSUVI6DSlNRATzZbFHF9IvgTkFPHCSDXXc276WTjKiOp6dMxSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB5GdaaG/miCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/32iChK20D8jp5o4Jp8Xf86hRM4YLJH8jHQNeVZpx/nkeX8
 zeuE2PRR0ty2Mak4TiK6HW3ncfUgDj2HokVEdWQ8eVxnFCI2ikaBBgXU3OrrP+hkEm8VtlDb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbizt1HUABRz9FLdYg68k/QGVy0
 kfTxou1QztyrLeSVHSRsK+Oqi+/MjQUKmlEYjIYSQwC4J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjTxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:UWOjkKtctITC/lOiPhaXR/vc7skC6oMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YaT0EcMqyNMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPHxXgspbnmNE42igYy9LrF4sP+tCKH
 PQ3LswmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZXbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczKgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxenkPK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesaMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO21GkeKp
 ghMCjg3ocWTbvDBEqp/lWHgebcFEjbJy32DXTr4aeuontrdHMQ9Tpr+CVQpAZDyHsHceg72w
 31CNUWqFhwdL5mUUtcPpZ0fSLlMB27ffrzWFjiUWjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.91,304,1647316800"; 
   d="scan'208";a="74160832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3tg4JAFaP5gSRQyotQMphOTzXeCWjrWOFfxiqEC1IeYF66ag8KZ03Vb6KYR08NPJ5pSRzNCjpzs+Dz54+rCV8a6o3PMENCL+uV+Po/bYyFmzQFJhVZThQc7CqZphn6pWbhfC2sV2AN38bzEllqSkQ632r5JdCZG190QbHWkOXmAUdaiXedNAWYtXn9mSbtYYOKsoV5HcnvrdP7JsRtn4E15iuCVkO7j5Kf4+Q3p8YC2mH3N4/Sh+SGqNq4gppIx0qImo2GUs0EHCy8lMg2ylk/SRfuhJVCqs7/LNYVFFXuD/hgyN2yKSNwqH3DgnIJ9skzz8uqlEfu0jJSsT2FdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kr1peAeuo+o6Y4MTO0SpFtyxBehm37IJ23frTcAsy5s=;
 b=jYfK1Cco9HwcTVuFL4xGB4YnLXu380iKjAGM9Cp5kZ49sVqD5UPO104IaqgSd7M93jCRMEJoOB5QHNugWO+JYyLMSLTFwUFAr3rureCJtHwBJY0sbYVy9RYE7M0V7n0Fh7SPjbuXoaixhqfoYTjF8LWuGSvcW5MrXirZiIl1LGm/KCkwm+h76UDGmx3aQcnJ3XYfBOLy6Hm/l5N/mUMNo3K/GVdVy6OYzm+dZbRIAsZL+Jh6Bs8FAQQbkveM2K0XUX0IT5X9AJ8zqgvUbUnAL8EX5hde6Ubc49bgLcXNrXaOnM0jJPWzPAGl91Y7ioyhr/KIzKLUPvx7GLslmKBPNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kr1peAeuo+o6Y4MTO0SpFtyxBehm37IJ23frTcAsy5s=;
 b=uExQKa4ExXqF1IN8eeo5axyk/+TfNTGWVNG0dNDp1A4iGiQXtYda+5RrDxVOZRCsiLJxFYO4MAbDE/h2gKy+YXkRRDIRE/2vzAU+WnDg68BnvH9O1GjPH4KFewtQZRIthPsU79v/OXntQsnVIang0/hZzZjM83s1PgRgX/cLcDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Jun 2022 11:52:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [linux-linus test] 171182: regressions - FAIL
Message-ID: <Yqr9Yt9ZsnSZ687L@Air-de-Roger>
References: <osstest-171182-mainreport@xen.org>
 <441665ed-f719-56a2-b8c5-85197a67242e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <441665ed-f719-56a2-b8c5-85197a67242e@suse.com>
X-ClientProxiedBy: LO2P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a167cfe-a14d-40d9-fd46-08da4f7df148
X-MS-TrafficTypeDiagnostic: PH7PR03MB6995:EE_
X-Microsoft-Antispam-PRVS:
	<PH7PR03MB699509C520A34B83B1F4043A8FAC9@PH7PR03MB6995.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8mIf43DtsitxiRL3Y/awLfBFfO93w5TL6zVxaXUrPPTQbizr35qVLjhfVWFwE0ETL6d6O13BRkZLHGMnRbttEK3jjioTrhbq+rmydFNtutcItBRrO3pQA6gt72AO0BiiAtfkGJu4EXq4IVyI9bVQ64X1Cjb6ghb9pWi5mMjdTb3/wXr9vgr1wakxTLvbTFakpTte/Ea5ZIvcbAbRu8oMQVYMeLjQXircbnGGr75whvR1XIOZnydAdStZCagmq5EgWHgtUgLS6c9HOnnqc/VOEzL5uusF/7Ck6811FLzUVmPAa52dP5IINpV9DSOPlyAwBvnYL346R0nPVtsoCpxAkfDYZKVcDOOXEkDLvLvklAsQYdaQS6v3cUfGrhibYMtnUvgKwwuB8h9tFMl9fYrl9haOcbZPCFxhUKTkOVRakQCD7XwsdZBMOsUMp8sfyPCDTAbyefcA9K7MKGiqpfxoNZYXbbErzXZH2buV7vBdlkVmaneKUaN5dHwhCoQaLTBdgWWMUn6hGlzzDWOaO2BvvmTdXSB7uwZRnaT4Hg7gga6/j80f3IA3DmZcmWv32QOKMHznlScEevWDfdbfjuhPMoiLasupj4GenX6xtVdhTCGHJq4oNKRuruMp9AXOoECabFvTQtvFIAhbM1F1b1CWS4ZasorwC/9IptfU7vVT3+XRr7Z7CLFLIoWLsWgwTVqjpgYTLXWhcSsE8nyExZCtdKtDtVcF3HF20pIvIA9k/7KUDD9839XXCJfTeZVI56mIMdQSQt9y1nIYRHtqpI6xZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(366004)(186003)(83380400001)(8936002)(2906002)(316002)(508600001)(6916009)(966005)(6486002)(66946007)(53546011)(6512007)(66556008)(66476007)(4326008)(8676002)(9686003)(26005)(5660300002)(6506007)(82960400001)(86362001)(85182001)(33716001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZSs0Z2dSb21vekRoY09yK3RUMzR3LzJiUldzUGNTV2FvTkdvMlFWMzNieXVi?=
 =?utf-8?B?dUs2Uk1UQ2tVeFUySEJDcjM4QlU2MytlcEVybWRuaGV6QnJGVHRXQmNiY292?=
 =?utf-8?B?RWR4bytNQkVqWHZWL3QyQnIweWIyWk02cmlNYzdhZ2JzVFVOMlR1eTZnUEFX?=
 =?utf-8?B?Q1R5Y3NrWU4rYVBSR283MDc5czVSYW11WXZDVUlMRjlDUlcybVNlM0FNOEs2?=
 =?utf-8?B?cjJSUHpHWkZvdlRBSFpudFU2RmVNeU1GN2NPMzhTNUdLaDNPOGJNMzhQbFMw?=
 =?utf-8?B?b3dDSDdtYmFjbTN2UVNWNFRqQTBZbjBTaklJSnpiS3RtTjY2ekIvVFBMMmZa?=
 =?utf-8?B?QWlGU25vK0EzS1pXR0tnRGpyWWtvb3BiUTJwTXJhNisyNzJaR2taa2g5NWxL?=
 =?utf-8?B?VWdNMXdGNG5aWk9RdGpwaXJ3UytDVjVIendVQk4wdkQrVzFSd0dKeGpMVnJa?=
 =?utf-8?B?Uis3ZlVnb1NSejZuNUZRbkg1emdOWlBDVmdpcWpxYnBHeGRMdHd4R0ZBNGd3?=
 =?utf-8?B?VlZmYk9rYlRMQkZrRkJVem5jcnBFWDB2azlFL1g4c3RQUGZ3aktXTlgzUWpB?=
 =?utf-8?B?cmYyV1U0b1RycjNYOEhjRjFFc2ltSjE3cDdDeUpMazJSRnJGSUhUMWF3WnM2?=
 =?utf-8?B?c0haSmpDL2RQMEs2Nis0R2tUY1dJRzdnaG1VV0t1ZWE1alMxWjVBNVZja3lw?=
 =?utf-8?B?djNPT09lMlFreTVZRVUxQy9KZDBmaEs0b2ppUURDOGJnWTNiNlNNZStpNVpH?=
 =?utf-8?B?VDdWSVdyMEd6ZHhLbFdFenpKQkt6UnB0bFBpVHVtYmMxM3ZCYzI3K0pWbTBC?=
 =?utf-8?B?YmlxZEhQcmoveEdPL2xhZEc0MWJWdDdxRDN2a3k2UThOa1V0NkFBTEY0U1Rk?=
 =?utf-8?B?bU9rbkM5SjFwQzVSeFhvZWFzS2RoWTRza2pNclBXY0t5azM4RlNxMG9JNG5Q?=
 =?utf-8?B?WTJ0RlNFcVh5dFlpWmw0eWxqYnZiQWtUSVNmZ3dFam11dVBSeS9KTHl3YTFz?=
 =?utf-8?B?UkpHUGtYY1pHOEhIMnh1V1J6ekw4bjYxV1h6OElHWjc0YXNJc0FTbnBUQXVs?=
 =?utf-8?B?b0M1dXorbnBzaE80dlRtUEtIRVY0dHg4QW5HN2FEUVozRHVYRkRGdHdNL0hv?=
 =?utf-8?B?OFBFY2JNUFdWY0VZR3ZPdWV6VExaclBBaExvMWx4Wk5jVVZEblFORXBKMHZF?=
 =?utf-8?B?V1d2RWRkSUxwdGtiS2tMZGYzMDArTVEwV3VYN2hXRThvd3V0OS80UW85dHNH?=
 =?utf-8?B?V050bk5VdzJCTUFzRHNMalhJNXRlNHVwTXpsdUc4Z2hqYVU3SkRmU1I3N2ta?=
 =?utf-8?B?RDh1NFRrd1U0UEZJL0pIa0VxUzhtNk5QaUhqcGNLQTU0R3dXZVVBdSttb0o3?=
 =?utf-8?B?TjVWd1JDdkdrS3lxMFQwQVA0RnE4OVk5WkhHQnBwRmZscm1rSUk1RFhiYm1G?=
 =?utf-8?B?dTYwVWJHbWNPa3k3VHJRbkJkNTdXeTFKL09qMVg4ZXR2a2NZaFZDUDFkai9X?=
 =?utf-8?B?bWZwVnZsQjhVUlZCK1I0UENFSzVNQmNNT3Bxc1gxUC80Y3Q4akJRVkpzWGxu?=
 =?utf-8?B?Wkc5TGhlUUFka21TMzczSjR0dnYzYlFOQkJQcGFJYkFlUXd4S2FoYUtpUFVL?=
 =?utf-8?B?TGc4WDRvYjZKdkNHT3R1SkpvM1ltbVhidGlKZHpSQm4yQ1IrRDgyUkhyaExs?=
 =?utf-8?B?eHZxZ2xDajdyVG9jOEFyTlp3OGtnQWdrLzI2MG92RHpVTjNxWGd2S3g5Tjdi?=
 =?utf-8?B?QUFzQlFUQ0ZCSzFZbHVFdDZuRGVjY3RvWkMxbUQzQlpIVXEyOHJiWklURjJE?=
 =?utf-8?B?R2VTYmNucUFoYncrcllqVVJRV05oVTFLYkpSdkR0RFQ3eS9EVkw4UHNERjRs?=
 =?utf-8?B?cHNKdURHaHJObzlJem5zT3JNUzY0Y3ZlOWJlMGlNVzNPUmpGbGFXYnBNajkz?=
 =?utf-8?B?WFpGZWVocmNRWE9PUTdvaVpWRVROYXJlYlE1STZIYmdJRXBOYkxEeHZ4UkE1?=
 =?utf-8?B?aEU2VGhZeGVYSUFpTGd2Z1BlK2gvd1U0ciszdFJwOGhjenNmMHpPdkVCZ0ZJ?=
 =?utf-8?B?UmJVNE9ONHZmeDYxYUFJYUV2MjU3ZlFsY3ByaHEyZVVRbDZZdUVaYTRwSXBs?=
 =?utf-8?B?OU9Way9POFpTbUJ3dW9oQm1oY2RVSkZqM2xxd0R0V0kxWFFBRnplOEg0Vm4w?=
 =?utf-8?B?azFxTzlDckM1d1hkeVNTaGxsbzhrd1pMMXN6emI1ZkY4RTZ1WUgyRk5qR3Uv?=
 =?utf-8?B?TGd4OWMxaHkxWGlpU2paOGNTbTBIWGg4Z1NJU3I3QkR2ajVBTmNGTGJwRGpa?=
 =?utf-8?B?bFNKNTU4Sm05YXBJVkZNSFVqNXplNlFGTXE4MUlYWTNlb1ZDYlBtZ1lGMnRF?=
 =?utf-8?Q?Yap70o9dAHH47n4s=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a167cfe-a14d-40d9-fd46-08da4f7df148
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 09:52:36.6131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09NY9prqS/B4kQyIrJ8HLQWKZQJUmycjiXnMixLh60NvGyKvxolUj9ZuvGAO8wxoL6AFknlgm+QtHRKKTCvpJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6995

On Thu, Jun 16, 2022 at 11:37:59AM +0200, Juergen Gross wrote:
> On 16.06.22 11:30, osstest service owner wrote:
> > flight 171182 linux-linus real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/171182/
> 
> I think this is an infrastructure/hardware problem. Looking into
> 
> http://logs.test-lab.xenproject.org/osstest/logs/171182/test-amd64-amd64-xl/serial-elbling0.log
> 
> I see:
> 
> Jun 16 01:53:06.737732 [    2.034788] Run /init as init process
> Jun 16 01:53:06.737790 Loading, please wait...
> Jun 16 01:53:06.737834 Starting version 241
> Jun 16 01:53:06.737875 [    2.639555] megasas: 07.719.03.00-rc1
> Jun 16 01:53:06.749801 [    2.640679] megaraid_sas 0000:01:00.0: Waiting for
> FW to come to ready state
> Jun 16 01:53:06.749867 [    2.640681] megaraid_sas 0000:01:00.0: FW in FAULT
> state, Fault code:0xfff0000 subcode:0xff00 func:megasas_transition_to_ready
> Jun 16 01:53:06.773736 [    2.640687] 00000000: ffffffff
> 
> And from then on only megaraid_sas error messages are following.

I think it's unlikely to be a hardware problem.  It affects both
elbling{0,1} boxes [0][1], and only when booting Xen with the new
Linux kernel.

We don't test booting the updated Linux kernel without Xen, so it's
not possible to know whether the issue also manifests when booting the
new kernel without Xen.

Thanks, Roger.

[0] http://logs.test-lab.xenproject.org/osstest/logs/171182/test-amd64-amd64-xl/info.html
[1] http://logs.test-lab.xenproject.org/osstest/logs/171182/test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm/info.html

