Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2464F51D11B
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 08:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322610.543985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmrDo-00063C-Os; Fri, 06 May 2022 06:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322610.543985; Fri, 06 May 2022 06:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmrDo-00060J-Lc; Fri, 06 May 2022 06:13:48 +0000
Received: by outflank-mailman (input) for mailman id 322610;
 Fri, 06 May 2022 06:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmrDn-00060D-39
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 06:13:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af2326fd-cd03-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 08:13:45 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-JcT1k8aqM56bkPfpwUokgw-2; Fri, 06 May 2022 08:13:43 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB7494.eurprd04.prod.outlook.com (2603:10a6:20b:23f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 06:13:42 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 06:13:42 +0000
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
X-Inumbo-ID: af2326fd-cd03-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651817625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/m6M5PdIo183XNuhsQof18u125pEv+4w031oOJ0NaAg=;
	b=TUiwnpiuHtCS0+F3QeOIOa1Arq6X7iC0IFNnecspyIGPvMVHlbNSoZDUMmYXttg1C0ZuHV
	9ndhgwqGHlInQD9HS8DwpoiNcRzAVMiM3VFNq6LLj9x8CcFOW9VrCfjtGJKxPIFM8fx/Ef
	fUhMrpEVLn2XGC4nZR8KZ3myjSf6CEw=
X-MC-Unique: JcT1k8aqM56bkPfpwUokgw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJ2wZZISCL3Fcd4DsJEfq9NLPXUvLY+ucRgDxVTtHvrNhPAj3nB4abhayhjU512wCP3Co2WqVBBhkr+upAo7g7ge10kYVvM47oAJxCgkePSBz04DTkpKqNtdLibLk143Zl5wKskCzFLOn4Xf2+df+OFt2GBPWUALu7xRbvweg+/TTGT8CZETwzovjGs5k9bJic1OJlOIBUChB+lVzaEyXNZKM5sh5naFyoLf4R7KeM2QL0CW5irPX374Mresm981T2Nl9e4qFfivCXPdlc1T8eVnLzK0QyA6xr+H0lRqa6aItI3Z1WZ0y7hrM5bbkyDBhGDjNsjri2WZIhF4VuUNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aC/TCQ7O2lIYL6GEdrh5mryY1iCV2JHTnM3E8OD/ylA=;
 b=V4m0wNU7QiVZx/P+jGFktMw+rW4JhE1DqKZj6EQPRtMFUOZngWikPjEy/4ZSkgL8KdfD1YdDSOFcncw6VpdC+n4ksR+WR3SRqcwYyeSYgiwF8D1ZoTR+4gnxx2un9Tagj/eVl6K58fyr6fiSuz0wRj2albAkavaMxSoXR2sTUkKXaYf6hcifVoZ1ANyfcp1rf4Vi+U0kWu2QqrZH6wuyHqujSrbgN8jzoB+1IMyLMF4IdY9qHSyhLPsTFQS2BRAvVp0unfBGGLksBDc7XYxOvGwS+YzmRipvMqEcZeAUhPD2MAnmJIadoSSCoh9ZeBII/mhDMz4yMyRMdJTNH7qE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e433c548-6144-4869-970f-a06a841f7c9e@suse.com>
Date: Fri, 6 May 2022 08:13:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 11/21] VT-d: allow use of superpage mappings
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <c73ae968-44a2-08f5-df26-7cf9b4a5b1aa@suse.com>
 <YnP5PI0zXKzWyM6a@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnP5PI0zXKzWyM6a@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0005.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::9) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acf39d95-79eb-4f02-1581-08da2f2791b7
X-MS-TrafficTypeDiagnostic: AS8PR04MB7494:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB7494F5A1F0DA197D8F28308EB3C59@AS8PR04MB7494.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3pf+lyQAzAf2zbDYMobZM26naYJMGVuRAQUQf2fUnXBBLiH+lH/lfuAUGbYUa0UWgqLQ0OHnUlqobkCImuPFyxLP6nqxTg7BMUR0+TGdxUw56uIKRqRAMfgaL0yKMqcglkR3vHjvhXddXlGz/CdGzjJCV08DqtwnizHs9eqLKK63E2JxZS/Fy4jppyMLnYU1FBuW1rZmtAXMZzKiiRj54EWR4WASEuRuED6FZyrI2du/DT4rLQYIaxQq4z+RBDmEt8/N2cZxxofkB78aS+4J0/v6j/iypgnEQxB50/5XRVozanYPp9Xgp5+quMrVIgBQB9R7GVQSOyyH6B0BxJn++gPogMV+OzV73n06MU1US6raTx1/GSbrwkOw7irfL6V8u1pEtoGOnt1xVtD6bErT3rQni9JRyjqff137UDN2iUE3aOnYwlaGj5jNZ1QELN0IH27XLVKY3iDWxYbSvzyUUd4qonLBkqYqrVA5JCEtlWnDF7Nw0V6G1hAalgj2qNgQ65PJW2tB9aGZ1ilaajZej0FcOcezwT9pC6OCkiwaS5i/5yXX3itpjt487TiXM4BTOyhPvgxVLjyH/Dsgwj/n4fXwo5vZPRdlkSjkoADblfQdno68N6AVN1QeTDzIkaicqBSg2L5thCmsmnW7Ryfu3AV6spuG8mz+cEotzd1iAv/jzHHcP52c/Nq2qyoLMIz+wjVSBEH6+/tR3UfLR5/xAWQqdOX+hdrzNFawAE3WS+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(36756003)(31686004)(4326008)(6512007)(8676002)(83380400001)(66556008)(26005)(6506007)(4744005)(2906002)(86362001)(2616005)(53546011)(186003)(5660300002)(66476007)(38100700002)(66946007)(316002)(8936002)(6486002)(6916009)(54906003)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?olcsdQlWVSlHzPd0Yy6/vXfqKQ2SpmgYsPJVNn9hNC1SPlDKrTtFT2jaYIFi?=
 =?us-ascii?Q?cSKJMXFpLCH+ZeJstxu5NqQmSNMTM+Bhz+I/YT4DEH+CMlY93kepmSMJuXXY?=
 =?us-ascii?Q?j3LFD/z6lKRzMKyIh8+qDTcMdvfxuddML+igV9gUKu0ttjXs9MtmpS/bcRHO?=
 =?us-ascii?Q?EyVjRXgEE6GCvfmms25binC1yzLPwGFisI9cREDqekce0R2vJpUm8gR++FyM?=
 =?us-ascii?Q?swdNUPgkamSzQS6qbQMIRfTcVNWAeU6SJDEFL/2NEmsGfkDEMqIllcvg1RIf?=
 =?us-ascii?Q?+ObkLCT7lHC8Pwt/CEV60Um0AZj8OgoV+uTuBXsys2dO+6iKDea2f/s7iPVo?=
 =?us-ascii?Q?LwRAIvN4ozffYJMf0Wjl6shKStfQ1rEjOKsR729g7QpaNQ0vtA6acn4ts9IF?=
 =?us-ascii?Q?uNfFZLsvZTQCs+7VgmbWYOMwZrhnnp8rpvUznsMcS0VzXTgUFvhcVeXha02b?=
 =?us-ascii?Q?VOY/uumfLHZZpSBECVnJKuq+pLEQXpKTGr53AsQio5REwM4KTJPBvBCCGOCQ?=
 =?us-ascii?Q?BsGAC9apcZREu/RJKmtVUmVTtzoKWTPmMgl3yvaFyry2lFALaU8Ddpz1JJLY?=
 =?us-ascii?Q?KZMKkNEdudm6Hsi7ICLTCck3kNazMUEW7TbVOLB4FsGwgtqe3KvN2Zo944cg?=
 =?us-ascii?Q?WpEnjypUeDlhEOTCUtkTU7BuwxVxY017/1Aw/ZLANjIh74uZEp264t2JsiHm?=
 =?us-ascii?Q?3cL8g0TV5g+seGe7g/3wJIoWs5eRl3VokPjtAGqvlG1zSb8Mh+5PttUzR549?=
 =?us-ascii?Q?91SgK1V2Zq6+Fpvqi/vlOg2f/tXTOcPftvcKsyIc9c4kKoyLCprinonUj5EZ?=
 =?us-ascii?Q?7tiGq+qvMSal0PcWgZTtusMkrZITWMlil5srOha+6VxrQhAuhCUjDN2RF31N?=
 =?us-ascii?Q?Bv31D1ovtGpXQARg3COqX2oyQluNV+oofGwtptAShrPGbqmXEL95WKaXDGhT?=
 =?us-ascii?Q?cwzXRnBEq/T/gjmgy07ayuRjgkCkrttw/OrxqEhZbY3+Qw2SSj+Th5GRVjcA?=
 =?us-ascii?Q?GwFpt7QPCq9MDJvhpc2VVSOPr10yjL0iO5m+I4vKYg5irnxQg4CSQZLNKGkt?=
 =?us-ascii?Q?o9ZDck6Jx1g79rpfgWhwywe3w3gOWerE+pwSt008IBZOpy1jMwwZH4NGyVIu?=
 =?us-ascii?Q?ZGETZbR3QmD9Gc+epWs2Jhp+CU1J5/anjuk/lpRZci2spwTo6pYa2oyzdfjq?=
 =?us-ascii?Q?wwyVViHSMZ4xfPZNWuOc6v06Kxolhz0M2FhmnTPTf4N8+9wssoFQHJF/eij0?=
 =?us-ascii?Q?M09t3dK0YabGQQvM5YIAiqrR/cSvKXbMzEGf9oRpsmqAnOyC7qnvKjg4r/0k?=
 =?us-ascii?Q?QBy8Ho4yxxqQGKFheCKaeePbGb76fqV0CRo/zqqdjBE8P25DPWvfr2DFmlBa?=
 =?us-ascii?Q?IxS+C5UYc7YFBu5RnWs/AIyS3FgeoE8HTgHk1GFR18fH8qDpcMdLhitOgMln?=
 =?us-ascii?Q?YXRA9FOCLY2M2LrjIzVM6+di9xxmwPk06kH9pMnNai9EzvaVJaued+KJPiOa?=
 =?us-ascii?Q?ygCwZV0TN7D5u0PJn2gsymEuWMnjbCL1t2McodolHasLUv2cVVFS80a6XQFm?=
 =?us-ascii?Q?XFYX4S/K4iTzhQqee1FvAibwAklIKi5QQwtRCVssHP0/tf7N1x0ZHg4manId?=
 =?us-ascii?Q?MpG2SWtHBgg7W8CCtZyWdoaXhkRlxlmGeItQ/fHgvIAw8yUTx/70CwsqTWjs?=
 =?us-ascii?Q?AvWbiKjE/Aa2OFqDs/v1MRyQLrkQvmb/FZN9gtVwm9t/KxF46/w6Ru2kfSnx?=
 =?us-ascii?Q?xZ/+P6O8IQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf39d95-79eb-4f02-1581-08da2f2791b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 06:13:42.2364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyR9O3fwWlmd5ioA0hZElt4fN8oGdLnuHzjAhtXpnl1Spl6YuF2oc0O0QD7/BmeWs3t+BckuLp8HZlVXrKEW4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7494

On 05.05.2022 18:20, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 25, 2022 at 10:38:37AM +0200, Jan Beulich wrote:
>> ... depending on feature availability (and absence of quirks).
>>
>> Also make the page table dumping function aware of superpages.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

> Might be interesting to also add an assert that the passed order
> matches the supported values, like requested on AMD.

Sure - I did extend your comment there to the patch here right away.

Jan


