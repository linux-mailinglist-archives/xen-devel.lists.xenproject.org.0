Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFB94D1999
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286899.486611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaEL-0008Eg-78; Tue, 08 Mar 2022 13:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286899.486611; Tue, 08 Mar 2022 13:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaEL-0008C3-2P; Tue, 08 Mar 2022 13:50:25 +0000
Received: by outflank-mailman (input) for mailman id 286899;
 Tue, 08 Mar 2022 13:50:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRaEJ-0007uj-Ab
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:50:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b18c7b01-9ee6-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 14:50:21 +0100 (CET)
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
X-Inumbo-ID: b18c7b01-9ee6-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646747421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=vaQJVY0eYO5A5TjnUkrtytZZxPG+7h7o5KII+En5qgQ=;
  b=NeMv8IIJWBDiNyGyj/iz3DL9lQVLoNlkjEwK8eIqBZh0DTo1WWhBi2QE
   q4wBwiK5XW9cTpobFNUQ+kzsUvSv72nErhatL9OYNpJ2xqvBTAC0IQ1f5
   NRpGbimLh3PsaDsRlDYfX8PbDPM3pYiHsD38qbCOBLkxScNtRLtHotgMR
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68055469
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iRSyS6yulMY2L/Ybyk16t+fDxirEfRIJ4+MujC+fZmUNrF6WrkUAz
 TcXCm+BO/ePNDanLt5/aIrioEJU6JLTz9RjHlE9rCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2YjhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplpbeKYhoIBr/1tu0geSkFFSVgFrJb9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JAWQKuCO
 ZtxhTxHMUXfR0UeHFssKbUGpcPyrH3WTxd6twfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krM8n7lGBgcOJqawCCc73O3rubVmGXwX4d6PIO/8vlmkViC3Fs5ARcdVUa4ifShg0v4UNVaQ
 2QP4TYnp6U28E2tT/H+Uge+rXrCuQQTM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht9HjCCFrsbaVYWmA7brSpjS3UQAXMGsDaCksXQYDpd75r+kOYgnnF4g5VvTv15usRG+2k
 2viQDUCa6s7neUx/LiaxUL+rTuRjKiUSAorzRrKUTfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8R5r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGL4C9TbwJtdiON7Kih6SdkifdpEmCgmbKgwjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8ylkUv3jOHHNCPOIVvgDLdoRrpihE9jiF+Jm
 +uzyuPQk0kPOAEASnO/HXEvwaAiciFgWMGeRz1/fe+fOAt2cFzN+NeKqY7Nj7dNxvwP/s+Rp
 ynVchYBlDLX2C2WQS3XOysLQO6+Av5CQYcTYHVE0aCAgCN4P+5CLc43KvMKQFXQ3LA7na4uE
 ahfIJno7zYmYm2vxgnxpKLV9eRKXB+qmRiPL2yiZj0+dIRnXAvH5pnveQ6HycXEJnDfWRcWy
 1F46j7mfA==
IronPort-HdrOrdr: A9a23:oWMLz6zfp651uf6h/plJKrPwKL1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP4wr5N0tNpTntAsa9qBDnlaKdg7N+AV7KZmCP0gaVxepZjLfK8nnNHDD/6/4Y9Y
 oISdkaNDQoNykYsS8t2njbL+od
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="68055469"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaqOIH+4y4wZ5rRxqD3pJeWTlVH1KLk1eMdt0pjRGrpn62CyVczVI8pQcVQYP+gkT3nR0ubPOrRw+pAOzRspjQyI2bo/N78wXLovt2UkpcmcyWQL90+nSdRh578h/jB6Vy6ohYV4JOOTBdqJdFAsCpW6mx/W0QhmEq/TOxgp69kTg1f1/P3qawY76josyDGal0KVCtmZCFfpa6Bg+Otrdrt5v7sHIvtIEqtEmWkwMF4O+kOWv9xOLgmUGWtmd6oFvtWtDrpjX+/mi/x66M/CjUHiOpeEndM6suQeowImLHbl2gKhmTjtMgjPrqRVMTd2Y6/7yT45Qr/gJRzzCs8A0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjlZ8Pl+NS5moZSBGDHV0ip1h1zHnxC1lwERKrmXVUw=;
 b=RJHY85FWPFLeAmpDSoUHm2khWPOQNAnvinK+PmZ/WPtrv2pr79JF4UrDymEA4huiDyIjkRr74nSsCuQMep1HsPbiK5QFg13uRNiRBRupPUY6Q/iJPenXDv7P1GT9+K1/APN3Oc3j2J61m8RYYp/2GEpz3biSxnIXIXmIVyk2r8tyOnbONowB+ZKnVXxoqcQ8jFqQ02Q1yhXxLEbbrtr7Iu25Pub/zdA9RVoatzMdzvPePAoMqRqefDpTTHbvqZlRsMsIKke+UXafVsUyGG4Imx4h+s0FjOt7gVjXLKt6/iFbNOBisyFr2XRn3VANbI7kikJTN7h7X5cQcZKlqv29fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjlZ8Pl+NS5moZSBGDHV0ip1h1zHnxC1lwERKrmXVUw=;
 b=AUXoi/IsLYujH9LCl1Z+D3L2jT/BPr/OFyT2s2K5qHpkqhnrjNwoXlB328Npri6z83gEHTXP5MQevEwFh+fzanY+vi4+wvAlU2nC3JJfx3+6X/KchdpFkWBfTWVRNDxaKnaC3SVqfpRQ1+EhEhlZsAq3Y+vuinF+rA9NcsaqHiw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/2] livepatch: set -f{function,data}-sections compiler option
Date: Tue,  8 Mar 2022 14:49:24 +0100
Message-ID: <20220308134924.83616-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308134924.83616-1-roger.pau@citrix.com>
References: <20220308134924.83616-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0248.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa1f69bc-573d-415b-7987-08da010a93c2
X-MS-TrafficTypeDiagnostic: DM5PR03MB2618:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2618C4C87CC6C7D42989B2CF8F099@DM5PR03MB2618.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jC260ayrF8Z3JgFJSntgErpXuex/HJNSMZ6TzbDJMnVSwhPt6+0z8KYD9bvFoLaV2ALf3l0yNgQg92mddIZ3lwEp4wFknCKuyMO2VN8cMAei4T/WMdQ6Z4EYJvEvdU1LHko+InZC6cOiheoe1EeMkZnufWkm5qZSh8hYzrqYKkwDpb9WgMUVHSVfwLXKkr9azpQDeW5QP0a3yLvUO4uom38zOPoBt/e2a1GBHK+PrdbbYBTVuVoJKsbJ8w/bAN/lIoQXyNvbFt8nWlyyZoOmd3LiTwIIDTkrNWbDldgcswlfwc8DRfBsTXtkf/cYP6O7mffOerf5Hcu0fwTrxNYe0nTdFEnTg2/4sbKseVS9Jf3sgW9iXBM0Zi3DSLnZEGv3PrhF3ujPGe6Gi8mBIRQSIbAu8DgvzG3dnsvPHpPI9HhgoSfYVYq3UyJOymAsUJVzRwYqBR/uqkjbEiOCEr9Fq3A5hypBCngCXJyProIyIN2CqcL03qO6dNHHbxIMYvAKn3VkApOW19tSHg4K0UySFoYGjL5d8Cpv0i0XpT9qp+up30D+j8rKu3j0Pq45b8W/TkC+sbB427jAcz9v8oRhQB8szsuilB2aSKy6gnV0rL1iQYRYvfnqmspABZIAnNMoHXZ2NWf1qHVgwU36PKAeCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(66946007)(4326008)(508600001)(66556008)(66476007)(8676002)(8936002)(5660300002)(6506007)(6666004)(36756003)(6486002)(26005)(2906002)(86362001)(316002)(186003)(38100700002)(6512007)(82960400001)(54906003)(1076003)(6916009)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGhTRzVQbjI5RE1OTVRiN1NxRWpKT3ZoK2M5bDdSRm51MDdKbFZJMkVtaWdx?=
 =?utf-8?B?K0ZrOHAwS2MxT1hQclY0Skk2Z0MvbUM0REVsWkNET2lSR2pVYTZraGs1cDhT?=
 =?utf-8?B?MTRUaWdWdVgwczFZQ0cvK20wUTl1bk9QeW9YZ2dQTW13WDY4dGw0NUZ1aVJo?=
 =?utf-8?B?S1ZHZGc3L2R2U2RIdUt2RE10Zklma2FsV3lhOEdFTkE3UnQvU0NZcG9jaHpC?=
 =?utf-8?B?NjJyUWVYZVM1WEFQOHd2dGIrSzhlYXZnaWJkYnlOeDZld2VDYzEzeXA5RW9o?=
 =?utf-8?B?T0pkdU1xOHA4TlBRcWFpSmNNdE94ZUV3dWxsRnVyQmZuSFVreUtUL3J4QXpw?=
 =?utf-8?B?dWdTeVF3TlNiQ2ZvRzFOYUtiaU4rL3h1VFBNblo4ZGI1UnFVZU9ndGxpaUh0?=
 =?utf-8?B?aW95MUVQcWtPZTZxK0NpekVEeG5YN3g0SGRsMWxaSVhVbHJNcUNwZ2Z2Y1p6?=
 =?utf-8?B?QlhaM2hLNEVDcDB0bmlHdVlDdGg3QTRkLzZrUUVRQjNKUUdyd0tjTTFrcVd3?=
 =?utf-8?B?WDRqM3Nrc1l1ajlMNzFzUllWOXQwL0M3azNmZ0U0UHZETHU2WXNDWkJSTGVu?=
 =?utf-8?B?YVNGMkhDNkdLQk1oOFVMS1V4cTExTTBWTWN6SEcvU21kVU9aTUVzQSt5N1lH?=
 =?utf-8?B?aUZELzZMVFB4N3BBeVQ0QXV2VnNTVkF4YTVXckR2QnFieXlqYWs5bGt1ZVEx?=
 =?utf-8?B?ODF2SC9aRi95UkgwVWUzZ3VZczVYWEU4SE1tM3pTMDZiN3A5dXhVSEZwd1Rt?=
 =?utf-8?B?VXN4bDJ6VWpKZ2VFQUV3YlZKa05TZ2kzMWljMWpwZE5VelRsOXFGUlhVSHJt?=
 =?utf-8?B?RVFEYTZTTkhiUnVBb0hleldVcmdVKzZsaVkweUJCcjN2SVROWXhVNjdvMGVt?=
 =?utf-8?B?L0VvZnhHd0pvVmozeTNRSldQcmNaYy9sYkVmQXAzSERraWxZREFacndPdW1i?=
 =?utf-8?B?WXk2czFkbVNSakVXWnZrYWtITGUxcWR3NVF4UlVMNmFtYzBpK1V4NzRIMWxp?=
 =?utf-8?B?dW40c2pEenN4Y2VVVmpjN2dnUnNRaHRlMFNXYmFlOW42RTMyZVlZay92VUYr?=
 =?utf-8?B?c2JXRzhUeVBnczVSdk4wM25UMWZXV0lYa3pmU0U1MXp1UjZSQmU4bmxUd1By?=
 =?utf-8?B?UVVra3JhVGI2SnNHR1p0TjNuRE9yRHlQN0l3UGpDRGRBWUU0Q0FUbE4vcE9D?=
 =?utf-8?B?SXVZeThYRmNwMUlJeUVFWHFLa3lqNTVtano2QVhzbytFTzIvTVJXdllyTDEv?=
 =?utf-8?B?b2RhOWsvNVZmU3RIQXNneUl1aGMvNC9za1lSQnRONmJyeDUyTkZmbnRoaVR5?=
 =?utf-8?B?VzlTWHpHQnVWdW9BYkpNcEpsend6ZXNZemlwWGJxRGk4YWNEb25qVk1ONjcv?=
 =?utf-8?B?RG9aS0szaWdEYlRaZjNXZWlROXRTajJZS3oyWWp5SGZCWXRYMW1Wb0QwcVVH?=
 =?utf-8?B?d3Bhb0FaN1Y5d3pVVXRNY25UU1RsdnNVMnlTUksyK2VxWW1kWUNKQ0wzZmFu?=
 =?utf-8?B?YXZMMGVrd1lTd2YycnN2Z3FTdkdKTERxMlJoYmdqNlNPRWtreXl0TDdseEZq?=
 =?utf-8?B?c0NjdDZPOWRjWVN1K0E0UFU0bC8zWHhUZk1ObEdtT0xaU2t2bkk1UHlZZE5L?=
 =?utf-8?B?VWd0VXBScExadExZRGxld29pMTZ3OCtQbURUVkdESHVCQmV2Tm1GZTdLd3Zs?=
 =?utf-8?B?KzJkWENIYk1xQzZHWHBrMzRrejhLdlVmUk5VQ3lVRURnY0cvelBzTGRtRDlh?=
 =?utf-8?B?S21YOUJQYUcxQ0VtYytiek9jMElMYTBZRHM5SXZWMnZqa1dhK0xzUElrNi9R?=
 =?utf-8?B?NUE5MTErS3R5TEdzd3lRYWh3T0lsWUdZNTRpdCtSbmw3czJFajd6TDNtTk00?=
 =?utf-8?B?VFR6bll6REVJUWJ6blZGcTJ2WjR5eFd4WEd0dTNlUisrL1lYV2c0K214ZHF3?=
 =?utf-8?B?bEF4M1NJMEJJVVhGYlZHMU5hR2JkT0tFcndrVjhrYXM2Qk5JNDJMaW8zbUk1?=
 =?utf-8?B?VVBiNzBPWFp1dll5eTl1bmxvWHEwTmN2OWtadTgxVkhKNU1XMzBzVm82d2J5?=
 =?utf-8?B?T1FLY2dvM2swaTRycEh1akNESm52MjZEMkFSRy85NnRuc25TbGdMd2orbURS?=
 =?utf-8?B?M3JiVG5QbjhBL3NkWWszQTBwbmh5bjRMaG1lRWkzYVRXT0J2UURNVVFLWnRO?=
 =?utf-8?Q?TDJUeQQKP8kE55paTtZFcLo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1f69bc-573d-415b-7987-08da010a93c2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 13:50:16.7892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4FqfL20OScC+wpanWTuLCYMe4XeoQJaBXuX/zk7oS3sL+W/+Lm+kRS0gcwHhDF7b77hNPOR05BZUkvF8GRE2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2618
X-OriginatorOrg: citrix.com

If livepatching support is enabled build the hypervisor with
-f{function,data}-sections compiler options, which is required by the
livepatching tools to detect changes and create livepatches.

This shouldn't result in any functional change on the hypervisor
binary image, but does however require some changes in the linker
script in order to handle that each function and data item will now be
placed into its own section in object files. As a result add catch-all
for .text, .data and .bss in order to merge each individual item
section into the final image.

The main difference will be that .text.startup will end up being part
of .text rather than .init, and thus won't be freed. .text.exit will
also be part of .text rather than dropped. Overall this could make the
image bigger, and package some .text code in a sub-optimal way.

On Arm the .data.read_mostly needs to be moved ahead of the .data
section like it's already done on x86, so the .data.* catch-all
doesn't also include .data.read_mostly. The alignment of
.data.read_mostly also needs to be set to PAGE_SIZE so it doesn't end
up being placed at the tail of a read-only page from the previous
section. While there move the alignment of the .data section ahead of
the section declaration, like it's done for other sections.

The benefit of having CONFIG_LIVEPATCH enable those compiler option
is that the livepatch build tools no longer need to fiddle with the
build system in order to enable them. Note the current livepatch tools
are broken after the recent build changes due to the way they
attempt to set  -f{function,data}-sections.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Split the placing of the header code in a separate section to a
   pre-patch.
 - Move Kconfig option to xen/Kconfig.
 - Expand reasoning why .data.read_mostly needs to be moved on Arm.

Changes since v1:
 - Introduce CC_SPLIT_SECTIONS for selecting the compiler options.
 - Drop check for compiler options, all supported versions have them.
 - Re-arrange section placement in .text, to match the default linker
   script.
 - Introduce .text.header to contain the headers bits that must appear
   first in the final binary.
---
It seems on Arm the schedulers and hypfs .data sections should be
moved into read_mostly.
---
Tested by gitlab in order to assert I didn't introduce any regression
on Arm specially.
---
 xen/Kconfig            |  4 ++++
 xen/Makefile           |  2 ++
 xen/arch/arm/xen.lds.S | 41 +++++++++++++++++++++--------------------
 xen/arch/x86/xen.lds.S |  9 +++++----
 xen/common/Kconfig     |  1 +
 5 files changed, 33 insertions(+), 24 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index bcbd2758e5..d134397a0b 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -27,6 +27,10 @@ config CLANG_VERSION
 config CC_HAS_VISIBILITY_ATTRIBUTE
 	def_bool $(cc-option,-fvisibility=hidden)
 
+# Use -f{function,data}-sections compiler parameters
+config CC_SPLIT_SECTIONS
+	bool
+
 source "arch/$(SRCARCH)/Kconfig"
 
 config DEFCONFIG_LIST
diff --git a/xen/Makefile b/xen/Makefile
index 5c21492d6f..18a4f7e101 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -273,6 +273,8 @@ else
 CFLAGS += -fomit-frame-pointer
 endif
 
+CFLAGS-$(CONFIG_CC_SPLIT_SECTIONS) += -ffunction-sections -fdata-sections
+
 CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
 $(call cc-option-add,CFLAGS,CC,-Wvla)
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 47d09d6cf1..836da880c3 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -36,6 +36,9 @@ SECTIONS
        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
 
        *(.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.text.*)
+#endif
 
        *(.fixup)
        *(.gnu.warning)
@@ -82,10 +85,24 @@ SECTIONS
 #endif
   _erodata = .;                /* End of read-only data */
 
+  . = ALIGN(PAGE_SIZE);
+  .data.read_mostly : {
+       /* Exception table */
+       __start___ex_table = .;
+       *(.ex_table)
+       __stop___ex_table = .;
+
+       /* Pre-exception table */
+       __start___pre_ex_table = .;
+       *(.ex_table.pre)
+       __stop___pre_ex_table = .;
+
+       *(.data.read_mostly)
+  } :text
+
+  . = ALIGN(SMP_CACHE_BYTES);
   .data : {                    /* Data */
-       . = ALIGN(PAGE_SIZE);
        *(.data.page_aligned)
-       *(.data)
        . = ALIGN(8);
        __start_schedulers_array = .;
        *(.data.schedulers)
@@ -98,26 +115,10 @@ SECTIONS
        __paramhypfs_end = .;
 #endif
 
-       *(.data.rel)
-       *(.data.rel.*)
+       *(.data .data.*)
        CONSTRUCTORS
   } :text
 
-  . = ALIGN(SMP_CACHE_BYTES);
-  .data.read_mostly : {
-       /* Exception table */
-       __start___ex_table = .;
-       *(.ex_table)
-       __stop___ex_table = .;
-
-       /* Pre-exception table */
-       __start___pre_ex_table = .;
-       *(.ex_table.pre)
-       __stop___pre_ex_table = .;
-
-       *(.data.read_mostly)
-  } :text
-
   . = ALIGN(8);
   .arch.info : {
       _splatform = .;
@@ -211,7 +212,7 @@ SECTIONS
        *(.bss.percpu.read_mostly)
        . = ALIGN(SMP_CACHE_BYTES);
        __per_cpu_data_end = .;
-       *(.bss)
+       *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } :text
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 715452aad9..75925fe145 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -88,6 +88,9 @@ SECTIONS
        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
 
        *(.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.text.*)
+#endif
        *(.text.__x86_indirect_thunk_*)
        *(.text.page_aligned)
 
@@ -292,9 +295,7 @@ SECTIONS
 
   DECL_SECTION(.data) {
        *(.data.page_aligned)
-       *(.data)
-       *(.data.rel)
-       *(.data.rel.*)
+       *(.data .data.*)
   } PHDR(text)
 
   DECL_SECTION(.bss) {
@@ -309,7 +310,7 @@ SECTIONS
        *(.bss.percpu.read_mostly)
        . = ALIGN(SMP_CACHE_BYTES);
        __per_cpu_data_end = .;
-       *(.bss)
+       *(.bss .bss.*)
        . = ALIGN(POINTER_ALIGN);
        __bss_end = .;
   } PHDR(text)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6443943889..d921c74d61 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -354,6 +354,7 @@ config LIVEPATCH
 	bool "Live patching support"
 	default X86
 	depends on "$(XEN_HAS_BUILD_ID)" = "y"
+	select CC_SPLIT_SECTIONS
 	---help---
 	  Allows a running Xen hypervisor to be dynamically patched using
 	  binary patches without rebooting. This is primarily used to binarily
-- 
2.34.1


