Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F06605B6C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 11:48:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426330.674708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS97-0001iA-LK; Thu, 20 Oct 2022 09:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426330.674708; Thu, 20 Oct 2022 09:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olS97-0001fT-He; Thu, 20 Oct 2022 09:47:25 +0000
Received: by outflank-mailman (input) for mailman id 426330;
 Thu, 20 Oct 2022 09:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NEB=2V=citrix.com=prvs=285423218=roger.pau@srs-se1.protection.inumbo.net>)
 id 1olS95-0001OM-Sc
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 09:47:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 310f8e5b-505c-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 11:47:22 +0200 (CEST)
Received: from mail-sn1anam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 05:47:20 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB6027.namprd03.prod.outlook.com (2603:10b6:408:118::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Thu, 20 Oct
 2022 09:47:17 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 09:47:17 +0000
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
X-Inumbo-ID: 310f8e5b-505c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666259242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=QkS8LmF8sq5TWLGpZ9BwE7SA8QxQS8KMGl/B93RqDpo=;
  b=FVXwRsZccfOBim01fYO9lK7FI9LFmLIlJErQMnlHWkz+3fSx/7ojCkCT
   CEawNYPIWe8odwMBh5Isos+F08kgcAHWfxAc4geBQvs1XG67GdMfZBYYc
   RTszJO/FakzvOEJ4fy4VdtjHz3D+zs/QKeYRgEtykYWIj1VFiVV6Jl9x+
   g=;
X-IronPort-RemoteIP: 104.47.57.49
X-IronPort-MID: 83565863
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+6RAi6y20m/RSUo74j56t+c5xyrEfRIJ4+MujC+fZmUNrF6WrkVRy
 mpMXmuEMv+LMzbyc9B/ao+/o09QsZLXmN9kHlFtryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtC5gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9vkoJEZ39
 uMhLzEQPjCqrbq/mfG0Rbw57igjBJGD0II3nFhFlWucNtB/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxrsgA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4Wreryzx1rGU9c/9cMENOPrj8r1RvG3N9FNKKloRcgS9//bs3yZSXPoac
 ST44BEGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6GAkAUQzgHb8Yp3PLaXhQv3
 16N2sjvXDVpubjNE3aFrO/I/HW1JDQfKnIEaWkcVwwZ7tL/oYY1yBXSUtJkF63zhdrwcd3t/
 w23QOEFr+17paY2O2+TpDgrXxrESkD1czMI
IronPort-HdrOrdr: A9a23:Q8pEvKP9U+Lgh8BcT1r155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBDpTnmAtj7fZq8z+8P3WB1B9uftWbdyQ+Vxe1ZjbcKhgeQYhEWldQtqp
 uIDZIOb+EYZGIS5aia3OD7KadZ/DDuytHVuQ609QYJcegFUdAC0+8vYTzrb3GeCTM2c6YRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoILSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwzqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0G7Q8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnJ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvsX+9KK1wUh4S1bpXUd
 WHVKrnlbZrmBKhHjrkV1BUsZORti9ZJGbEfqAA0vbloQS+0koJjXfw//Zv7kvoxKhNNaWs2N
 60Q5iA7Is+KPP+TZgNcNvpEvHHfVDlcFbrDF+4B2jBOeUuB0/twqSHk4ndotvaM6A18A==
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="83565863"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FN0k2f0SLt+yLEzYvl0FcivMxOLn9YFP+fUBcFXm4BZ7+UjGHR5zOhDuzINvW56WbYhV7tjUMzt9nAOkuNjCr/uPtktUT76iHFZez7AVnilmS2FfaCQzR6OcMtMK3KWy5Fl2nFACYgvDnbWDMPkcEdgQg1lC52KYJ3PS5iFpeC5NVdCBua0Re2+UniEf6HRzAWRqfgPPEF7uI0JIH3RZULWgGhJ42nQK3m2Zllxnf5NeaiUgF2FS6Gu1Ssrx6I/V314N3vNK8fAQTOnKSlHZcv98wmlt4wNRedehFxGX5oQSdirpiteaBzGqLDjBWb/YZ4LYzPWpiU2g0zdwXW6btQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c55b8Y3FjLXBmFEK2e5vgOav21j93/W+nW7shNB4ico=;
 b=BZWSDVUQtLN/IGapOPy0aPwsHHx98HU6Oz1RA5CjdFfBe0btMVQY3m1ZCr5vchD//1eydWM8sAt9qP483ILCn1nbgUrjlM4gxFoVmQdiy4gPxPYJrFif9sWTAiNdkZx8bYEyxeJf/8jXAoAlLiTOC4HNxlj6DjvsoX+/ykvl9RoPV3FJJSzNcGMHy5pzkGtlwOm00v43x15fEhtprMZv0pED4U8R1wTq0IKP5bxVBwy5bT9shtSjW+wPBGcSKxscpIhKungsf2TZuaKHKDM+0Ampm0SxM7tALbHscypguXf+7MiJpdOx2bHfcQMP2nNHPUCDjxeVe4HfXdoj+t0T+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c55b8Y3FjLXBmFEK2e5vgOav21j93/W+nW7shNB4ico=;
 b=TMkSEZ7HbEsEYS4WWlKyZvwqRIRTjidz0QwrWSU+hfF2uWT9xzdfcueDr9pPGdMcsyeyB7Fm1Y/u23zgdJzNR6hh8u+oDBfxNACXViXE5Ipxp4MJZ6ecTW5cSIATELIO5FP0gGUdygvUC+O4tLIfF9wUPI6QAowGlmlLsywM4Iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH for-4.17 2/6] test/vpci: fix vPCI test harness to provide pci_get_pdev()
Date: Thu, 20 Oct 2022 11:46:45 +0200
Message-Id: <20221020094649.28667-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020094649.28667-1-roger.pau@citrix.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0129.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: b946d289-54f6-499c-2921-08dab2801363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LPrOBerhvRfX8ELjtef5u+RS3zO56K5+LchbSJ1ERN88/SPq6BhqvscIGigf7TwHVWzaqSl3GqP3Et/8T3KyCnKFrw+jQty5Z+XklESexvIZacM9FVa4jJQ/MB3vrs2KUioRC9aOijK0LeYoVFQDW/9E70I/UrPY71BIDTWIH3O515sSUxlq5v/sapIFH8imm298ne+HOB/Hrtiwoxhxhb6pVbqW439Jy2LM0Lxvkx9JSspqJmeKwg+/uSwgh50qCg1qy5+rA0/aLtxuEbnR/hSpLl6KoHO/y3++Q0r3/6KNxBQd2a7cZ36Gls+FoZIRaEdvIHvgZYh9x5GLATOCVPzITZx0UaZQCMrgNilMHxLuQexzaKHbocV3GTNzzXvgoBxGgnj+sW8FhNpHD6ARSc8dxX5G0T8s3irwZ9c+pbzc16dXkKMOFa5wiQyFzqrixUrTiIurOs1YHjdvKE0LnwnJFwzmcABEICVEJDxR/C4HVu7L+XI/99N5XPpuyTowerugJmZNSKsVy0pDGRuAmPZHjumQjFcJTDMKv/4TuBEbfN3UeZWsplkzF4nWTqMJGSo89lOAN88mRizF4wBzUCJiZAZ/TnNBDybKCED6tis8XsW1vJT4Fi6oha8I7cAHSk+tT5SwCP8qioS61rDLMpIoYwxfHp6c9BgXVFgmJ81FKcvvfNrpwKQlpfDoVkl7oTwpvTH43GgGb6prWi1J6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199015)(316002)(54906003)(6916009)(6506007)(186003)(36756003)(2906002)(41300700001)(1076003)(2616005)(4744005)(6512007)(5660300002)(83380400001)(8936002)(26005)(6666004)(8676002)(86362001)(66946007)(66556008)(66476007)(4326008)(107886003)(38100700002)(82960400001)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U012bkNUNzdadEc0UnZqSmFDdU9sMUZvNHB3MmtheTlzMjVDVVJ2eWFuWmhM?=
 =?utf-8?B?emR2dnJqZHgwdzY4UFg3NW5MOUxRRXNoMEZGd1lLRmFWV3pWZHFHRmFGV1Nk?=
 =?utf-8?B?UE5JYmRFTDIrdy9UbWZKTGhyMlNqeEt3THAxSmhLUGlSOXlsUjVlSzJqaEhF?=
 =?utf-8?B?Q3I5Yzh6K2xEVjQ5NmluT3VaWGVNSkNFZGR4c2dvdVhrZ2FFZHpoSC9kS0hO?=
 =?utf-8?B?VVlnMlpndG1oemJ1MkZCWHVHTVRsdGNiNG9rMFhGdlZGNUVLRlk0WUZtbXdt?=
 =?utf-8?B?UHpSbjRVS2g1T3lYdHU5VCsxczJVL25JTGV5NzNuY1dJQVM4TkQyRnQ4Mi9Z?=
 =?utf-8?B?cUh6ZDc5VEVWQ1JVUXkxSlFjdjRuSyszQTJvU0plQXhBUHFOT2VWbk9DV0FY?=
 =?utf-8?B?MnBtYVc2U25pa0grQ2hyT2gvVXpOWWh5WU1TbkVoaHRnd1FFSU94Tzh5TnJB?=
 =?utf-8?B?VUtIMmdKemVPQ2l5Z0pFaU4yRzhQeG1vUytlR1lRZnZReFdBVGxmZ2dWcXpO?=
 =?utf-8?B?akxZajk3OVJJVHZJQ3VKQ25HcHlkVitUV2dhb2VHc1VTUWtKSkI1SnNWdURu?=
 =?utf-8?B?ZkJQQzNaVzRwWFlEUExva2phWHRKcTBya2gvTCtRVUxQY05yU2ZNQTlkditj?=
 =?utf-8?B?cE51VHViRXUrUGlXRW9sS3ZNU1p6ZVJiNTAxdTJWNk1JaHM4TnV4ay9hNld0?=
 =?utf-8?B?R2V1Tkx4V3ZrV2JZbmRZSGJmWE5jaUs4dnN3aVZLRktQZlRwczMza1UxVElj?=
 =?utf-8?B?a1lRZG5XOTkvcW1VWEFIcVFTUTN1UEdITUFqbFcyTThnNFNKVzJsY3U1S0dW?=
 =?utf-8?B?ODlsZ0tpMXV1R0VkSHBLbGROSXUwcmtSRUpONmZPS2JpcTBGTFpNU3BYcWR4?=
 =?utf-8?B?Tld5SFExZGMwWHVDVWlDck1KTjNFb2pzM2NoNE5xSjJCUEFyNjdXZURCcElM?=
 =?utf-8?B?SjRLT0JsMDlkcDJINkVoekxJSlNNOXJ3TWt1cnhDNHBrOVl3Z3Z4allaTTRr?=
 =?utf-8?B?cFZxbDJRTmRjRkxVQzNHcDlVQ29zeGFSQ0xxL1pnc3Q3NThkMTRNQ3pmWVBu?=
 =?utf-8?B?TFVQQWlrVHQ0amtTNEg2SHNGOEpNN2U1ZjlTZFF1TGNBSWtsVlZYWUo1dThT?=
 =?utf-8?B?YXNIUkQybFhhbWdiN0NVU0pucVY4RjNkSlowbU5kMjd6bi9hQzBCU1lPZjJK?=
 =?utf-8?B?QTB5ZkZrMGVNdmM5cnQrL3ZqdXFtcVdtMW54TlowZGg5NndIYUpvRi8yVkJQ?=
 =?utf-8?B?RFpNT096U2pwcWZ0MndkN1BaOWozalF3bGtlYlRpV0l6TWFpUlhyL0duMDVx?=
 =?utf-8?B?YnoxdGJUd0tBT2ZLSDhWQVkzdkxTeXI1dlhldndUKzFYcFRrbGEyTkVlMHln?=
 =?utf-8?B?eS9CQWZwa1pQUktySXJvamdMb0RTYjk4WDc5cGYvT2JOV2ZFdCtrdEZ6eFRh?=
 =?utf-8?B?ZWd3K05ubmZNbXR5aktCU200a2xPQ0hhSEJ1M2VNSGlhOFo4amY1OHh0YWxq?=
 =?utf-8?B?R0Y0bDJKTXp4MHh0UUhQMUw0alhNcDFVdkQ5dWN2NzRlMDMzRzdhOTY0VFgz?=
 =?utf-8?B?akJxc0Nid1NpQ052THlRekRLenNmeW05ejdtM29UMHQ0TjZSbEd1NEh1SlVx?=
 =?utf-8?B?SE9hT3V0cTlwd0drNGFLMHVuNjlyNDNTZFRZSnNna05ORGVRRC84YlREMzFh?=
 =?utf-8?B?SWp1aXJZKzV2amFIRFdZeUVYRU4wUTZQMXovMGVrNmF3d1NnOFpJK1owQ0hr?=
 =?utf-8?B?TUVhQkd4c3NTYU12ZEY0R0xmcjQ5SDl0cGllNWhoSWlXRU1GNVNjQjZrZEF6?=
 =?utf-8?B?THZuWnpjYkZ3THB4SFE4RlZFWE5RNCtPUEhKK24zTTFsUE5OTFRTRC85VUFU?=
 =?utf-8?B?NUoyT01zMTRZVGVWbjVNNlZDYTVBbFA5amFSNExUOFRwdzUwa0U0aFloNWVx?=
 =?utf-8?B?MmdHZTBoc2VCSjVZZGI5WlhoYkNxU2M0TG1KNXQ3MklNTVlrTTV6WFR5UGl0?=
 =?utf-8?B?eHV6Sk1IRVF5MS9FUUNSb3lsM0d6RkJXdnlpeTJDYTlhaHpkRWVhaXlXUlV6?=
 =?utf-8?B?eTY2RGtVNjZoMllzcWp4V1o4OTRmeFlFeWVkR1ZlVjZjU25BbXJ0dTdNZzNG?=
 =?utf-8?Q?nE2H+uuayPnQyayOfNuUV04zl?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b946d289-54f6-499c-2921-08dab2801363
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 09:47:17.8419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WcJTDQp2pBbNm5ANZnAyQ0wsBzAkhlGSfiohPMfyrVVRrtR6AUiVjN6zu2Hr8nyuCWlBo1uWUwXde1ukR2jPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6027

Instead of pci_get_pdev_by_domain(), which is no longer present in the
hypervisor.

While there add parentheses around the define value.

Fixes: a37f9ea7a6 ('PCI: fold pci_get_pdev{,_by_domain}()')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/tests/vpci/emul.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index 386b15eb86..f03e3a56d1 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -92,7 +92,7 @@ typedef union {
 #define xmalloc(type) ((type *)malloc(sizeof(type)))
 #define xfree(p) free(p)
 
-#define pci_get_pdev_by_domain(...) &test_pdev
+#define pci_get_pdev(...) (&test_pdev)
 #define pci_get_ro_map(...) NULL
 
 #define test_bit(...) false
-- 
2.37.3


