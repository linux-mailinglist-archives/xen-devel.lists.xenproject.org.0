Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF1A4CBAF1
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282886.481722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiJH-0000DX-2G; Thu, 03 Mar 2022 10:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282886.481722; Thu, 03 Mar 2022 10:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiJG-0000Aj-UJ; Thu, 03 Mar 2022 10:03:46 +0000
Received: by outflank-mailman (input) for mailman id 282886;
 Thu, 03 Mar 2022 10:03:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPiJF-0000Ac-Am
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:03:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35185231-9ad9-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:03:43 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-xFR8aIQLOmuOSteST94oFw-1; Thu, 03 Mar 2022 11:03:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 10:03:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:03:39 +0000
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
X-Inumbo-ID: 35185231-9ad9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646301823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fOFzU625NT/VL6UrChuv7E1SuzrdHI7R7/toSu/2RdY=;
	b=Cy3psdKguMUrAbxvZLNznYXNh56HRDbkDGERaHnuoeFWRWJz45R9t12hhQ2Mik/k5VF9WG
	yeMpMBztZ4nKXrbmHZ/DZmUfL4vxis9nKylitQ6cWkx6RRMCyy8ut3jjzHRLwAd033YCxz
	zL5kgs5Y2j8/BH9CmNC3viT2gwFUUWQ=
X-MC-Unique: xFR8aIQLOmuOSteST94oFw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzeQwuiUc6Q3TIaeGZdiOnmrosb2/3lNbD5GE5pdImIRdLOHpSfALjYo0DYeq4BZc3ZwJiNOUq/w5LmbAcO/tg/Uk3fy+XuPffAIlbELgNTVdUPUerf5ks2kTbFHiA0S75UviiJo6dPm/u5UP0JeCXUTjjQLTbTzzasnuwzQrNMCInAW7gEU+O6hUotwB1RsPWLn4X+OxNqAr2laPwpGj/SXUswyqQKwClIUtWgooT3YH3qtCfFpp6FAYAd5yP/2bPN9cHPeMHumIGZP7zu//TLkMx61hj54Q/RRcdqLapDh3D0Yi510BpCgjNdPRGw27M4kOnS/pfZumCRY+6FZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOFzU625NT/VL6UrChuv7E1SuzrdHI7R7/toSu/2RdY=;
 b=QU8g8Hh0PbSdJZrud8ObYtRERjWiVazF2p/Msgz3oin2dVchJvulne4i+xsM+RM0Ds1T0OCbun2XbYtZJEY3bBGzAumZgIT/VIV4HDvqipvZnxQdUNJFNwFJJkEzghFucixUD8NnxRsW7MaKwMUY4shTeCNRRQc+4tjUJgoyMeZRuJ8IyUPQ6kcEDGAEBjyLCTDGvNFL43TiuRo70cTrHqP8TmAosssAIJSu64kByok6Mk/66PoLifr7wKFQLavFHnHzdhWHJgaornSB6EJOiXTSfcGFNapYjcMftl6eHSvxvFLPwW0jlm4boFLGpnHAz84J4vOAISNRrPlPqbQ9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c0d6eedc-6ea2-5445-117c-0ba623692d0f@suse.com>
Date: Thu, 3 Mar 2022 11:03:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/7] (mainly) xz imports from Linux
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0351.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67f833d4-30a5-4bf3-d972-08d9fcfd1736
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6347EC6BDAF220845AFCB0F4B3049@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x7fQefiGNPlbSK5LcLxbUA0I2ejTmmOpHAN9Ai9IVM8Rea9vDPvGwZ9D0j8fdob65Ud0wFJDBjLc7QaNas7Ou3Q2e3LALg1NHi0IdFOF6HLp31m6LUDfB9qnohnnzTX2d2MiFsPjjxmEB7vxHunf+FOAKYi18tPzv0A8qQFuazDBmOLajzaLVbIr/tAP9Gg5dVOSfoLZLlj4jKPe19vgDb3vXcRZBSKBujySQL2oKpvGCHd2K+cQasqh/9JgmahLqg8MSypB+PCZpHjW3JaRA1T5eVL8kxHisgsy/xMSjaFzbUKayx29lwNv8kPnGaPyTk28o5bLMgUXZquclWT15e/Fqd8uGruFkoHW/GEVpF9KX41xXPgd4CxV0u+Mh/oodnYsEi9DxBNWF+sL0yvApwkeOUHs0SB7Jiw07ydQSWKa36yVhKMyHb63ugIYTI7+Wpd/4psRyKRvfO/KaSIHgfiJSrxKxENxk+IpsKaO8wlb62qo+I8Ewuy/34DyHjTn3dIy4iA3/6H6tJY2F36yyyhF/Xfx2ySELl61ZAehrkHVsDs9+jYI0ha98kwHYfJP7OaQJiPH6nulAIeBEWe22QqteiUSPwPTUtJ5Iq1COAzZNu1sAncmuU2aUWzfAj+XT9IUawu0vgplg0yZoofSdlEpb8Zkp/k3IYSHTQVrSx6Kmd+Y/xNYfjdXUwmsmo+CAbbaAvNyEpTFWHaEGshMj2uxMHbQoDqKsSsVRP5wz79lcTMIp5cS1ksKK5pxRe0z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6506007)(508600001)(6486002)(26005)(36756003)(31686004)(186003)(66476007)(66556008)(8676002)(54906003)(4326008)(66946007)(83380400001)(6916009)(316002)(2906002)(86362001)(31696002)(38100700002)(2616005)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekJjMDJMbnZrT0dqN29Hcm5SN0pmR2VPNWNHbGJkOTBnVlpXRktWTnNGV1lw?=
 =?utf-8?B?M2E5TWs3Yk1FS1U4Tjk4VVYzQXNSVXhmQjAxdjdNTVRUU1VoclIrQ3BMVHM3?=
 =?utf-8?B?WitSY01iUUZDVCtFZjEyay9hZ1g1L1g5YkF3SXUzTXJIY0FJdk12d3l5NXV3?=
 =?utf-8?B?aEh6WkViUDJYaC9xbEprYjJuRWVwYzc0WXVGcTN6a3JVMlF5L0JWeWhKcjNj?=
 =?utf-8?B?L2RpV2xaTGJ2SDg4bElQQVVsMzZFckNHWUFsRFU5VDlRbU5SS3Ria1Y0WWVV?=
 =?utf-8?B?amRTOURKYXlPeDViODdTOThJRXJla2lzV0V5VTRSdXU4S2Y4QXhlRUZvNVRs?=
 =?utf-8?B?Q1VQYW84ZHl1UDNXUHdweURLQnJNYkZBY3lGN3hGYjByUVI2Ty9zMytPdFFY?=
 =?utf-8?B?ZzE3ekhBNHQvZ1Q1ekRISzgrbkdIMWJKdEU0UjhPM3gxOXV3MENMdEtmWlhj?=
 =?utf-8?B?ZXJybUJOblNjNUM3VkM1QlFEQjJ6Q2VJS293Uk82bnA0Q3hvQ2NSTzVTNUJ1?=
 =?utf-8?B?dDdDaCtmL3dSdVc0SVdraWxkaGs4TmhUVEFHOVBySnVrbWlZUFpMWVFOejdL?=
 =?utf-8?B?YS8wOGovbzlPT0dGKy9vc1NZUVFsdklVT3MyUUJISkpWY05LY1h6QVRheXIy?=
 =?utf-8?B?ODhTSjZRdmJ2OXV0RUdJenl2ZktLV2IzZU1rcC9uVXhsT3RhY1N5eTQyc3Iw?=
 =?utf-8?B?bXJRaVRlbEoxdnErdDVXYkFtK0VuR0lncWduNHNMd004SjN5TFN6Y1FlYndD?=
 =?utf-8?B?VlVtdXo2NjF1QTl6UHN4aUNkalRRVk1XSFA5T2pobldNNzgvY3pnZVY5d2VX?=
 =?utf-8?B?aUsrb092NUhRUkx4NWZYZWFSak96aFQyR3NPOEtQVk9CaGpqYVFOYmR3MXhO?=
 =?utf-8?B?Y3RkRjdQQmhzREZWR3RtSmwwWjhSRU40enpOV1Y3OFNHMkxHK1p2dkwvWDdj?=
 =?utf-8?B?ckhURno0L3d0UHhjbzQzYUpEOWZnUlZlSE82TmxrY2FLNm5jYUF4UGJDdENY?=
 =?utf-8?B?cTIvazRIQ2hvNWU5cy8yR0tGbEY0dE1wd250WGlJUkRNU09ha3VwQnVCODZx?=
 =?utf-8?B?WVg0OUhZTjZQTVNKdjk2SkNSMDl3a3hlREloT1ByeElMdExRMk0yV2pOZzBu?=
 =?utf-8?B?UzBWZk9yR1VNOHpQNWpWYU5seVVoNWJmUC9xSVF6bEI4aTFOK1FZb3dYMUhx?=
 =?utf-8?B?WEY0SGpKeVdRMUZYSFY3L1QzUWI0K0R1a3ZqRU10dGpRUWpoUUQrUUJadUhV?=
 =?utf-8?B?bVFEK21FaHU4QVFiem05QjZLSmpWSXQ0ZUl3QWtNdWE1blNjT1NLK2c4L3pQ?=
 =?utf-8?B?cVNvK0FVSDJvVFJ6ZlFRV0RUQng1dDN2SzcxNUpHNXJGV1BaVGp0QUhiRmhm?=
 =?utf-8?B?NG1qYmM2eXkxKytFRFBBRTNUeFY5RHl4Tmh5dlhQM25kNEt3SG1tRnhVcFJK?=
 =?utf-8?B?U2N0VkFGTU54SzhoYU5UcmgwZWxmeUxDNGVPYXVXVytSQ1JyVEZvblcycFZO?=
 =?utf-8?B?OEZWU2hreEYya2dNR096QVF2UnEvRVFUMEVqbUFSSys3V3RDaU50dTl1QThQ?=
 =?utf-8?B?cXUvaC9HOTBMMVNCeW9SelFxYmFpSW15U01yQ0I5aEVjRUI1QXo1VWQycmRF?=
 =?utf-8?B?ZitYemQxT05OSVlNV2paeVRHYStLdkMyaU8yNWZCRytUZnFzb2ExU0lSTTRZ?=
 =?utf-8?B?N1NVQys4cUhFS21SZDg4b0c3dDNWMnVBY0tBN1FZUElFS3FjMVVpYllqVEcy?=
 =?utf-8?B?QkxKbWZsejlrOHVxSzdKOW0rbUhTSVBQU3RDZlh4OTQ3OWhGRUtNSTZEMWt3?=
 =?utf-8?B?ZE51dVVSZm8wbXRhM1Y3dG1ZZENoaWFNUXNxdlJCYlgzZk1NaVBCT1pBRExY?=
 =?utf-8?B?MzFtVmEzZUZ3Z0RwbDhQT1JmalloVWVQb28vejFYbnhvcFNUby9uSUo4WVR4?=
 =?utf-8?B?K3ZCcnlQVjhuaExBdk00SWp6dWVkeXpLUWw3VE1hT1E3SnRZSk1iUEdnRDdH?=
 =?utf-8?B?UEhzVThRcGhhOTdhVjV0WDVsS3dpcnBjdkVjdkFiK1VEeGtvL1VxNThrVUQw?=
 =?utf-8?B?SG9zSllRclZYNjRmMTcraTF5NlZtanRvRTJianE2dmpldzZKVEtkMDVGRGV2?=
 =?utf-8?B?aWw5U2ZIcHk3aW1icmNBTlE4RHFUNHdKUmltT2dkcHZtQU1odjRYT2dtYmhR?=
 =?utf-8?Q?+qTzSUIr6iNDncLn7f3/SeE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f833d4-30a5-4bf3-d972-08d9fcfd1736
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:03:39.7750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjglEyc6UV3h2HAw0WFp/ykxm2ysidpxJ19WxE0OsPjJREwnXEE2rJqzRFAfrmv/QnCjkCT4DxvS2yeeFOww3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6347

While going through their 5.15.3 log I did notice two changes, which made
me go check what else we might be missing. The series here is the result.
Linux has also updated zstd, but that includes a pretty large change which
I'm not ready to deal with right now. Them moving closer to the upstream
zstd sources is certainly a good thing, so I suppose sooner or later we
will want to follow them in doing so.

The only change in v3 is the re-adding of some previously dropped S-o-b in
patches 2 and 3, to satisfy the rules newly established by 5e326b61693c.

As the series has R-b by Luca and as the (not) retaining of certain tags
was the only open issue in v1 and v2, I won't wait long until committing
this; perhaps just until after the weekend.

1: xz: add fall-through comments to a switch statement
2: xz: fix XZ_DYNALLOC to avoid useless memory reallocations
3: decompressors: fix spelling mistakes
4: xz: avoid overlapping memcpy() with invalid input with in-place decompression
5: xz: fix spelling in comments
6: xz: move s->lzma.len = 0 initialization to lzma_reset()
7: xz: validate the value before assigning it to an enum variable

Jan


