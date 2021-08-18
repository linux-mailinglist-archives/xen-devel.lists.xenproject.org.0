Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A753F0207
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 12:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168184.307056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGJAj-0008Fe-6E; Wed, 18 Aug 2021 10:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168184.307056; Wed, 18 Aug 2021 10:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGJAj-0008Dj-27; Wed, 18 Aug 2021 10:51:49 +0000
Received: by outflank-mailman (input) for mailman id 168184;
 Wed, 18 Aug 2021 10:51:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGJAh-0008Dd-7u
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 10:51:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b80f38be-d14a-44aa-a325-3e8b4e2be7bc;
 Wed, 18 Aug 2021 10:51:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-QZk46N3wNw2kVjDHDxYBIQ-1; Wed, 18 Aug 2021 12:51:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 10:51:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 10:51:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0057.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.22 via Frontend Transport; Wed, 18 Aug 2021 10:51:41 +0000
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
X-Inumbo-ID: b80f38be-d14a-44aa-a325-3e8b4e2be7bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629283905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O6hzL3DNfA3lW70WyigyFIOgcuReGlZ8hd47kftdOY8=;
	b=g4gl7JwiB34jFcXWnzmOlqBpHue4rTMfG88dAb8UJXvKYmUlypkdWOljB+Vu2YjintnqHn
	UR+aUI609XNpvIviJQ8Dl33rzgXitDb+f9oJhi4GTSVfTIHq+ja18ao4MFbdKBSUY4J4OC
	R/do7eiRQNzTaMGwsir3YEbzEGI3BFA=
X-MC-Unique: QZk46N3wNw2kVjDHDxYBIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFBJgUV539R/3z+vCpKlSmUJHj/BcSBojn33mHHdxEi1C4bL59oFIYOHDaeJhTJwY16TtGnFJu1xudaO3yrC9u4ng/TuOpzqnIOcvIj4E91HPReTVPwlaODFHwthW7+kMftwOd7hHmsDZ4/avwKBTf5wgqG4EYOXNRM5Go5i6QyWGY4n9ZQnJr/OpwJCikCAMuUkpdbbQtkAd0PZuG2m4AV6xjkoN10k/6tjE56VeFubsolWtT8pBKNpBoMRXI3uwCc2MPd8yr21LCheXtNeSVpgw8SQUq1lQkRXFXB73yca1JoNyGf/RG3D7LxF3icWX7FWs++iGxL62ufO8CZr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6hzL3DNfA3lW70WyigyFIOgcuReGlZ8hd47kftdOY8=;
 b=RaOYCCmUPFsVXYnuJre9pGuqS3NCbQVdCFDT6rRBzUMYmn0XS2TtSsWHTBF3utlLT3s/p2BXz3fGGlWRVzqsmph2D+QEC7Ij4ntV1crXkTVzAN0rW9E+m8BmKyQKXBSvRuC17jkjU3NSAgNI172zqQyp8syzqBgVlaOX9TtCbRAm4d0uaglW3+va0h6VOihVYkQEhIiIpIZRLvNvPAx2JE7SEV3d+DkjaUbhJyWH5wmcpPado9qltG3uEoZhXghPK/dt5yQ3GKSdfTdkkp1M2enWm3xrtzGleaO9g3hXR1HW1rfmmtNynXh9SAkQXB3W9AUkU0ALoWU7AG0gUw/7DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Paul Durrant <paul@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: meaning and use of IOMMU_FLUSHF_added
Message-ID: <d6a6e5a3-5ea2-638e-1eb5-2fee73d82188@suse.com>
Date: Wed, 18 Aug 2021 12:51:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0057.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f618208-3097-48ad-7604-08d9623629b3
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606EBDEDFF48F7BA1A4D482B3FF9@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mglc2CCr5ROLWDR7MwteOWLqBxc22TZwfGIXd44xqMAE6Eig7CvKee3ZjUrr7z69o/1LA+BLw6LRA/b/0+FFJ5G/Fca6Vm/QdzZUW4PWZ4L7y2WJWV6IKanFlE4GSSE4gu3czzZuQi5HT9MCSDBuX5ZOc0Onvt2AviMEySfmcA4OPfO2MHs781JthQqLeoF50foQU6ZmZ7HwRoN6xCyqMUQqMZY1UHEcNFa+78RVMLvO/beMuwH1PdvtG7iVVyoX4tMVTp5xaOk3B+riisoWL0kCunL1C4VFZkbRqen+yigP4ayf3ENbG9tqSDqV0z3cRUNRRrxeylUE614OsEcvprm+RLSsdm0hdMl1eIXp+/NXLy/09j4de4Oj/589K9PDr0dCl1MmFSLnw4qWc4xz+1B2QK5gUH2aRtX8hJnq+MCpgwQRsHE1L2m9W1BYDTwRdcJPCp1hS4ANJVuAvQlQINugr1kAF8HPTqddLKsVO7TTJZDQq0ew/uEsVzGScwYi6XJSwpRIuaZ/OVoc/v0kx59s9fYiOJ9Alx3/YSwuECsHV7Gr5n+bEyIK7j09h7GphUrVJDvJM/aS09uyrr8a7D0k6u8p0/pzfsnHCKHPMrXmYSltNoeKUOOu4THfDdJVRX4Upq0eAIj17dOy7x4+8t7NVAygZPK656RgaRDof+a4m7pfoVCXraboQZzo7cBdMIx+kXsBuXDZmOsn8GChDfk2/WtErpAeOFNPdW4mtn8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(376002)(396003)(39860400002)(346002)(2906002)(31686004)(478600001)(8676002)(66556008)(66476007)(66946007)(8936002)(16576012)(83380400001)(5660300002)(86362001)(316002)(6916009)(38100700002)(36756003)(6486002)(2616005)(4326008)(26005)(186003)(31696002)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjEyK3dMOGRFQ2ppSVV6MEhYNXd0eVo2Y2F2bVhqUlRNYnZ6UTlrYmVvWVBH?=
 =?utf-8?B?YUFQaVQ0WEoxaWVaNEJUOEljNzB0K3VOSktYWFJ5UkhuZnlVM1FtM3JDMXU3?=
 =?utf-8?B?WEdURWdUbFFEa3RPa2ExdmRtcWoyclBvR2pnWm5wTndtaml2a2xlMGVyeFhC?=
 =?utf-8?B?aUxxTW5HemN1aXdjR2RINW00N0R4L3dWY1Z5aHFFVHdac21oMzFTKzgyNEdt?=
 =?utf-8?B?OS84cmxub3U2cHgxTkEwWFZkYlpzdXQ5aFNQdHFRTkdFTjYxRUpVNCtIZjRL?=
 =?utf-8?B?VndWd1Z6bWhUTFh1OTA1V2RKZVJrY2NIZkQ2czdzT0RxQXlhdUc2TEc1NWg1?=
 =?utf-8?B?WndFcjgrblJEbC9uaW5vVUVIL1ROVUxwQ090em1oWGZNZTgva3BzTlN2RWkr?=
 =?utf-8?B?NUFsOE80RENIMWE1ZER5TFU5RnppN3k5WFUwSFNHR1ZaU3RISWJwTXJ6a05T?=
 =?utf-8?B?YzAyM0RKeUl6UmdFa0JRSjQzNGdWdVZqYWtSUGlRKzhyZzNXVkNBcnZNQitS?=
 =?utf-8?B?RDF0bjZPbTFieHJmL0FNbUZ0Nm40LzJmU1BFODZYWnRYZnVHdGpiNEhEeklL?=
 =?utf-8?B?UE9TbUZoYWt4RVdaaHQ5bVl0bUlnblI4bmErSTNYUWRrc05TS0k0dk4rTDcz?=
 =?utf-8?B?NUtIQm0rY1VNZ1lYdVE5cm9vZ3NSN0JDK3krNk1heGwrV0R6ejRZZjFCc3Ro?=
 =?utf-8?B?ZUJFZ1VDOWJleWFzOWFEZGNmWUhTWWpwMzlRNWEvTmRJM2ZSQXZoeWo2Nkox?=
 =?utf-8?B?am4wUGpIMW5xN1lGK2lGTExkeDFsNHVDZERRQWlaeFZ6aTd1bHV3RE9naUpO?=
 =?utf-8?B?L1l4MzdkaEk0aCtOZDdDYllFY3VXZElvd0t0NFFCQ2FGUGZmcUNpaVU1YTEy?=
 =?utf-8?B?ZUxYSDBvK0RnQmFSVUNOb0VKaFVOK1l6RUxzZG4yY09UZWFaNmVuVVFXczR4?=
 =?utf-8?B?Uk9pMG1TQjVYbVpRMUJnQ2pMRlREYTVxTVdhaFlYREV1QndwWkcxcmFDQ1hp?=
 =?utf-8?B?bmxGOXJvUzhMbDlKeDN6WlBOb09wMkEzWGJ6S1hPUm9PMmNwK1F1c1p1VzdJ?=
 =?utf-8?B?YjJIMVp5ckZBN2Y3ZDFyam1lK1BnRGFLRlM0bGFmZWcwVG5lQ1dYaEtNNlNV?=
 =?utf-8?B?cHVMTTBIZjNYNjNTZTNpODZGcktzaHBxTEtoU0ZnUmxUQzRaaVJkNFNUNmtS?=
 =?utf-8?B?bTdqcVZxVHNMSDR4S0R2YkhuclJCWW1MeFY4MUNQR2xuNytBTDhNbXgxbWdQ?=
 =?utf-8?B?TG1OTDVpS0dXeFkvNHFPdVJ4L1lJSWN6WlQxeDNXcG1tLzJZcHQ0cjZESzd5?=
 =?utf-8?B?NGc2aGIxMGFKNW1pTlViVkdUQS8zZzlCUmdFcmRnano0WEJZOFQwK2twVXFI?=
 =?utf-8?B?MXBQUUhldnI5YkRpZmNYaWE4UjkzSEVPa0VrK2pYSHc5b0xrSk5JbHhlZnhM?=
 =?utf-8?B?dGovTWpHa0ZYaklsSUY0R1FMcEdhb0t4cVZHOXN0dFFsV3lSQVJBdlBMVnBT?=
 =?utf-8?B?NEhNOVhPN3J4LzUvME1WK1MzUys0K3RkSDVuenVtRXVJbktpd2ZDTXNhY0Vn?=
 =?utf-8?B?VzYzeHNURkNubWo0TjU1MTVzcWpJbjlzRnN1RlFRaCtzTTJLS0ZweWRmaExW?=
 =?utf-8?B?elJlc2VoOVUyQ081T1E5TW0wWWJZU1Zldk5lM1BJYVNYRG5rNUFSeHR2Kzhx?=
 =?utf-8?B?eTNMeGV2LzJPYVpzUWtySS96MlplMDBoVUQ1U3d4M1ZtRW5DVmxBOE9mQ1N2?=
 =?utf-8?Q?ZtBEGrwZFlW8on8qwuTsNufMwtISVsmvhlBsFuv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f618208-3097-48ad-7604-08d9623629b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 10:51:41.7968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJcezsts3H+35jutSZ12BpPlQZT88rtHuWAH+m9qEq+39iwIg5PrCMPksKBSHcVTwgPprm8NiD1fMjA4715gXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

Paul,

back at the time I did already question your intended meaning of
this flag. I notice that there's presently no consumer of it being
set (apart from yielding non-zero flush_flags). I'm afraid this
model makes accumulation of flush flags not work properly: With
both flags set and more than a single page altered, it is
impossible to tell apart whether two present PTEs were altered, or
a non-present and a present one.

VT-d's flushing needs to know the distinction; it may in fact be
necessary to issue two flushes (or a single "heavier" one) when
both non-present and present entries got transitioned to present
in one go. Luckily no flush accumulation has been committed so
far (besides some during Dom0 construction), meaning this has only
been a latent issue until now that I try to get large page
mappings to work. (I think I have page table construction working,
but after the removal of some debug output I'm now facing faults
on non-present entries which I believe are actually present in the
page tables, albeit I yet have to check that.)

Question therefore is: Do we want to re-purpose the flag (my
preference), or do I need to add a 3rd one (in which case I'm
afraid I can't think of a good name, with "added" already in use)?

Jan


