Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F239A50A226
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 16:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310259.526978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXk5-0002uz-9D; Thu, 21 Apr 2022 14:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310259.526978; Thu, 21 Apr 2022 14:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXk5-0002rw-5Y; Thu, 21 Apr 2022 14:25:09 +0000
Received: by outflank-mailman (input) for mailman id 310259;
 Thu, 21 Apr 2022 14:25:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhXk4-0002rp-Ge
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 14:25:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7b9d775-c17e-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 16:25:07 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-rPQigAdZORemerd36MD06w-1; Thu, 21 Apr 2022 16:25:04 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3392.eurprd04.prod.outlook.com (2603:10a6:803:7::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 14:25:02 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 14:25:02 +0000
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
X-Inumbo-ID: d7b9d775-c17e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650551107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zM1LKk9xeaEG5O4uovlDgLDOoSnwZ50HaYkeKJA9LUQ=;
	b=RJot3wGv8+WMHDS6ro1jxz9FmXOiPGSpYVH3aGDHIrUHmoURO1qftKU9zQJSfwt4Ezw4ia
	jf7I+bp+eodZ5ePczpc9VYMrq6qkMuUM1JRCFFoDu/Tu3Q1tAqh0M7kf+H7Kw7uF3pb7l7
	IkTnAy+BYcriSEuuU3QeFgJ5VPm/51A=
X-MC-Unique: rPQigAdZORemerd36MD06w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2JSC+GbYNWW4HihKKHjAlakacOH2H9WMdh77+UqnVgkAnAkaUgIU8x9jIdtNWHgD9neYauSRf+/jaQ05EjIGG5zQyHsLRQiE07JynXt9xPjRjbnqt83VoO6R33H4Qpo/3AsB+6KcZW6100piBjdgjyJxhy8iik+P204fuPbp7NMoPJdcO7wf998MWFkRV/5/Dqq0Rqe+tborGWJmnXzcM/pXlsnfbG1rtdjyhC2cGUFq3Z+qRdHYSIeV5TjKGz6ZymVTd+j8aVxjyqwU7ptCD/AMw8wZ+rLW/GxZyXsE4pjEHz9EEvtqb3ol7X/6gz97cE3bFukbuDaXT9Y20fGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zM1LKk9xeaEG5O4uovlDgLDOoSnwZ50HaYkeKJA9LUQ=;
 b=lv5dh8hkNjTtq9aWDZjA0neBqFSSeuQrWavOd7MqivT6528UCfcxFpHM8DcWpWG4LjoEBssKqC08g03uH7iASCsw7UDPyQp6SMx9QdiawT3fOdq2pjxcSMPz7UTwINdXMu72j7CFh0qNeumfJFTdlXVbtqBDW1YqL6yRDGfwUDm2O2MqhT12XyCI/r8ob3iZONVpZfaHvJdxmptX0rTKXASSbAYINn2o35v/q4peLwGbKdXjnMTj+nQ4m+2nmzetnnoU1gEBFPaAhDSAZbC+F27kAYAwfBdO+WcCA+UbnYs7q85oxSXNE+1rbbGEfiLU9pPckAOCMF54OXFRNLaBqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a471a5f-497b-1015-8554-68117863f48a@suse.com>
Date: Thu, 21 Apr 2022 16:25:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] IOMMU/PCI: assorted follow-on to XSA-400
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0547.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::21) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8392b5e-a43a-43ed-7433-08da23a2b8cf
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3392:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3392FCE9B5DA8B4B015FD71FB3F49@VI1PR0402MB3392.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cZcxVvaB9u7TMuIH+SXlTS+gnXyyLmKM5eml9lT2EtXeKnbwWwEb6i7vfAeUiYUKwnEENn1e00YTfDVeiHgSSihJYk+lIl2T5CTHv9APy5tX2WgDyCuUu+zwFVWa1V4iDwTBHqqZOKA9vU50OmmmLV6+znWTmeBqG3BYoqJQQCsOIq0Cogiug9estcO3ftVttan2kDME9iaTNdEVPAEmljMnH1xdcwYNDSrW4fb6s+51Ryx9x2GM+whCWyJzcV2re4IwX7I57h5DypHDD43MjWia0e5ztezrWQ5NSWVLc7F/hXd+vxP2647zveUI45QBO9uWCae1TbqhcU5W5wLb7+jRgBtLpXH2yoSEnHRy9uF1KeCRphfyNd2BmZIKEptBXqiOTVhlSoqeba9tuaolgmTMs2KG7sqSadZuxebq4ZeY6SPKv6cy1buELvcJ3FEwAVVDfZKMzIIszCx3hTHhnyFJQFhQRw3l2YW5oOtersM3GPehI+SJlOZbDSurY7U3mucTtJ0VGS8mJi09gAPRHDFfenkNepHcXbCwbAscJP58ULe+ni7TrTnV0StPoGnQNuHva0ufgznaOSX1rhEekPiMvaoColwklpbESkOaDNKmKg2IZFVx76Sr8YkMLRV8wkENmKeXvMJY7mgW+tHMB4WFwNZBGqRGpLbR4QZd0+U3filtgrGS5VowCmLF8NKd3izd4BbFGr5qFvIfoeMxrDxqH3ytLSQot1q1koxvN3W+p4JvAq3mawL6rGVwAvx5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(38100700002)(86362001)(6512007)(6506007)(6486002)(26005)(8936002)(558084003)(31696002)(2616005)(2906002)(186003)(5660300002)(6916009)(66946007)(66476007)(66556008)(8676002)(36756003)(4326008)(31686004)(54906003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXRvRFJUblRzNTdoNG9XazJBdVBMUkwrbVh5WTI1U1JDRmFhM29RUUNBVFJ6?=
 =?utf-8?B?Y0J6WVR2N3h1OHZ6SElBUlJZTE5IUVRBVDl5VlZzaDB5K3dZQzBiV2dPQ2wy?=
 =?utf-8?B?OFpGa2ozTHdhVG8vNVNlMU9LU2NtNEloT01qTkRmM1ZRMWcwYmlhOTVqMnF2?=
 =?utf-8?B?NGl4V0FsVU91bFdTdXZNZ2poY0FNUVpyWUxHWFJhVXo2Vm90T1JUV2dVaVJq?=
 =?utf-8?B?Qnc1QWNSMHhBdmdpRTdrejJZSUxIZVByY1lnRmhCRlhKbWNBWkowV2paeldn?=
 =?utf-8?B?ditiQ09Nb2szUUpGb2E4SS9PU0RMRjhldGJZWGhrMDFNcWV2alErSUp6TzNX?=
 =?utf-8?B?WStvWmMrNkxQWER6ek1pT2dKMmpucGV5NWJwemM0akx2TW91UXJZY1VraHg4?=
 =?utf-8?B?M3VVZm1pT0NXa2ZZd0Y3Yzl2UkZ2U2gzaXFSbWxib213dkFsbjRwYnYzMDN0?=
 =?utf-8?B?bXRYQVVIRFQyMkhOZnVUUVVhaWlVN1JKNjdNZ1NHbHpZVEw4RDhmZ3pYcjc2?=
 =?utf-8?B?aXdaSGZKZTNwWFpJWmNXRDlYUVRSL1VvMDBHTXJlZkNBUHNtYStjNUtUUzlS?=
 =?utf-8?B?OXZ4S2wrUUhGeWNxWnp1ZVVVVWpNNGFOdDFySFNJUnA5UGQ1c1VBVW04WnU4?=
 =?utf-8?B?M2JrRFdiQ1B2akJVT1Q5RGV5aWk4VHIyVUk2OGpvSFFLdVlNbnNEYWRqTlZK?=
 =?utf-8?B?eWVqNEJMOFVvOTYzV0xOWndEMjRWamRQMGdkam03SitBM2FyTElPVWFveGpn?=
 =?utf-8?B?YnF1a3dFTDd4SG45eU9JMFhLUTI4VXZmV0dUSnFrQW5Gd2VwYmVJdzdKOHZW?=
 =?utf-8?B?ekYvV1YybjREVkh0bmJlS3RzTVhQVDFEUzlWdkpIYVY2RXQ5ZXE2ZXJhVUVi?=
 =?utf-8?B?ODJUcDFJUkxpTVRJNzY4ajlDdVVzSDg2L1ZJZVRLZEhqeVl6b0gyMmNyTUVW?=
 =?utf-8?B?LzFVT0FpcXloL2diUHpWVWJiUUtYNjUwd0QwSzV5TFcwN1EvZVJjTHNjb1gv?=
 =?utf-8?B?cjI2ZWZVMEVXdmZOb3VkcnpHblJESDAwOEgyTnppMkp5OEUycEduZTY3dW4v?=
 =?utf-8?B?aWl2bnpLYThVWUpjRzFrZ0dsSjh3RjYwVkhVeTlEZ2s3c1dRZjlrcUJNRTJq?=
 =?utf-8?B?R09SUzNjTytnVXA3QVBsdEk0RDJpTk4vaDE4Wm9WU0JQSnJrQ0VOa3B1NmtS?=
 =?utf-8?B?MHVLT1I2MmFiKzJBUkZTb2d0Z3YvRXhCMkkxeUJLVHRvT0JGY0YxajZCT0NT?=
 =?utf-8?B?VEcyWi92Vk5LZFFGL2dqbVV4TmZsM1h5NDY1S1BMK3UwbkY1dXoyVXVZZEZr?=
 =?utf-8?B?TWN6WXBSK2sxa2VVc3Y2emRYbnBNbTFpQWk2dGVBTGZhVGk0YUhGM05VbzFo?=
 =?utf-8?B?dUUvd3EvQk9iZmptTjdYeHVyL21WcW9jNms4ZjEvVFBzWXNRZFNCVHIxVmE3?=
 =?utf-8?B?b056ZU9CTWZ5TDY4YzBhTER3QnpZWThrUFJPdXlXM21jYWlpRGFnNjcrS2Zz?=
 =?utf-8?B?S245dHFCL0h3NmY4WFZYNU5xUmFvOXBoZXE3VU15ZHNXdkJreVc1OTh6bHRo?=
 =?utf-8?B?R2Y1cFNxVTliRzQxekJwRXlsVU0xbXJMams4eTQreTVPZnY0SG9qTnZiM3RI?=
 =?utf-8?B?dzhscGl0WEJqTnp5UDBaenUzeXNVQnoyL1lNUFZkdWZPcTM5NGZLZDlKcjl2?=
 =?utf-8?B?VzZnWHdDZFBKcTc0dmlsdmUxRTVOVXhzY2xWbmd2VzFod3djcTFBVmdpNGgx?=
 =?utf-8?B?NnJGYThGTkZEeHFjY0FxOU00RmxoNjlWUzFZUElkazNyMHJUQUcwbVhPVGcy?=
 =?utf-8?B?QmJVanBQOVFlM1h3NC9DM1NIVFVzZUtna29BOENEMmY5YVk4M05ZajEveGt3?=
 =?utf-8?B?QitvTUtnM1YvbkRIdUV1cmZ3Ly9SK0pNVUhjVnFreld6enFxdmIwUEpIRUN5?=
 =?utf-8?B?elVIbnMrQjVNd0VPK3hVMzRLVlJhRytNTmFLZlNxaDFCSWdxd1IyNVlIeVBp?=
 =?utf-8?B?WG5NNHdpL0Q1NS9yd1lPQWgzN1IyR3RPOU1QU3ZZMXV0YVI1Nk1kVWR6WWJq?=
 =?utf-8?B?NHpnZmhRT1Q1NW5CbkgwdHZFVXpsQjloczd6bU0vWkZaa25xdVZHcVhwRmUv?=
 =?utf-8?B?ZHhhbm5HQWdPK01YV25xbko3RDZ4TVNkVEF6cisvNEQybHF0MUtUZ0FRWVF1?=
 =?utf-8?B?eE5hSExBbEJXVXlpVFBNNDcwbXNyVGxkRGV0eWZZNjJqUUlYZFFqVmdGTm5J?=
 =?utf-8?B?VjhvZXpiY0p0a0VXZjdWRE94emxzLzVMN0EzQ2NkaUo2NUxJN0VCN01UUnlN?=
 =?utf-8?B?emM0a1BkYlQ4N0Jxb0JsT3phc0Npc0IwaGhqWjJvOEc5bWovMVFlQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8392b5e-a43a-43ed-7433-08da23a2b8cf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 14:25:02.0030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6Mga0lIkYCVIxiwDUvlgOKrNeKt08Ozkj+SV96hEB2GL0gJD806TO8TXTSl3WJOSkpheAktD7DirYfj6yY08Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392

Just the two remaining patches, with the only change being a would-be-
build fix to Arm code which cannot be compiled in the first place.

1: PCI: replace stray uses of PCI_{DEVFN,BDF}2()
2: PCI: replace "secondary" flavors of PCI_{DEVFN,BDF,SBDF}()

Jan


