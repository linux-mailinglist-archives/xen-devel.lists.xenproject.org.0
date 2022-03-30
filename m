Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCF44EBE81
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 12:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296194.504132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVN7-0000k5-9H; Wed, 30 Mar 2022 10:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296194.504132; Wed, 30 Mar 2022 10:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVN7-0000hI-5H; Wed, 30 Mar 2022 10:16:13 +0000
Received: by outflank-mailman (input) for mailman id 296194;
 Wed, 30 Mar 2022 10:16:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZVN6-0000hC-37
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 10:16:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b672024-b012-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 12:16:10 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-8YXU2N0bO0mJe0X-KLTiEw-1; Wed, 30 Mar 2022 12:16:04 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB9569.eurprd04.prod.outlook.com (2603:10a6:102:24c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Wed, 30 Mar
 2022 10:16:03 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.019; Wed, 30 Mar 2022
 10:16:03 +0000
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
X-Inumbo-ID: 6b672024-b012-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648635369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UNOxUHuzIjbhV4rTP6rwq1mEc7v5/CQf3ONg4fa4k2E=;
	b=Fw/Vnj0BVV/lvS9SqCmyPhkVew7uAq368+WMVqrRDggmLu7MdfW4CNHODLfDdP65Da9lCH
	qqheQTExTK1mso8qDOaGxRLOi1noyLD5ncb86toFCOdfui9kdbqbS0DIcGQ8fio7gZyWTR
	YDBNetifV1rCpee9SuVOwwvc9Hs7WEc=
X-MC-Unique: 8YXU2N0bO0mJe0X-KLTiEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODA8iPtkdpcZASlGKuj0OHLmEZTjlbxcnjOI8RvBs3wrrUS8DbwHWa4DOskfnQ5astNwgmoaTjEKQDlGEgYinbZODdgOjMCdz9at5RqjkdD41K7j6eTZiVn5nJpmS9Mqd/irOJG6d+EWJdWsvbXzrvg6rnQz/VB7S8dWTkZNumE9sdS8dHPOkdQ/2G4FJzoX0zxeKDIRkKJqDD2avH9PVRCe9kZ8V//Qn3u7BQWWqHdNM0/wyAwL0EfA7rzoEJLeH+JL9JCDobgEjex794ApEzTlDQ3Q3ur4guZCL/LMImv5qh5AZQMxdzv7Agy55+dz6o4yHuOPjpQH80VU8lihRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNOxUHuzIjbhV4rTP6rwq1mEc7v5/CQf3ONg4fa4k2E=;
 b=inIz4QVDF7r07buYGlEFb+/AwLCc4EWtjYexlyFnz5P6o9m85j3S9QJ/Y8GuQxuFDHaC931evLnDNWN3rhEB9jiz8ltXO6sAqEpLzaCs2Q8JLkLctDG5WPvRTo7hsV7syCeWBBLWfVdz6M0Op8KNOO7McOFqKOE16ZKV1Oo44z1u+NngJb0CM5D5vU2ZqJ3EiM6A5SQPEwJB3rdcNw31dJCi3/jL13ARdZArYH/ab6Dz+T9Yppo/qbA0uYT0UdLjv/XcFkZi0xRZYgP+rdLMzNETlKetGnpBWYW5JwYt5/Bx5rDrjEgYJQZVZowr5Qtpoqt8sUZIJ7bvK+XJvj0yyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <466e1d4b-a4b6-0797-ca1b-1ea59a3993ba@suse.com>
Date: Wed, 30 Mar 2022 12:16:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.14.5 ?
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0079.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::23) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66377a3b-6a7b-4ae3-12c0-08da12364b70
X-MS-TrafficTypeDiagnostic: PAXPR04MB9569:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB9569A9665D6BBB5DB251368BB31F9@PAXPR04MB9569.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nz/jM1XnpzaNnRSz8K93LB0ZJBSVuzv3rSK2o7B3y2KlhmIS3qWUOIJKNcJFI0xymt+d4mDHz+xudUt9CCbG4FL939p8CwVDASdHPfimyZv1vTsdbzBbPtx6WzyxZLtUtMgoramR1d+mNAgxCEcfT9GOhweTBWZv8HkPlB+JOAvduzg+nH5mEbo0CIxMfAjxYCU21TsiY7JmX6kMO34q3bL+tR/cwJhdu9RzhbpNxfVAB8pycTz/4CgfiZaVKxEepAw/6cxTNO2i1egc457DgzfT8uBd11x0f9ASiANTNbwj4ZJ2IiSjEG6fDkUUMetLBjB7mJKmSb3G1D5u5x/N/nAt9fhdep9UJm7q4vPMvjTqJK9k+/F7gxee3kd8OSl7RTpyErVUg9DRS3V91wFeD0y2/DbJ/yas4k5C+Udk7UFtUqNXx1auxukxQnFLHh61ctIraVXiuVeT1oqn3KS6BIvF0LiS3ZgPAYiEufuSHRF6lY3I2REKYCEMf52RMyOiyeSCOTsDdg2JQSHzOT+Ixf4wlrxVMp0pL6RPo86MtNKUmipl4f3SIhch8ZyhLtLBPf3iEukSKRXRIKez1R3szPHQj5Wuwk+1B/O0d77IRnUcVTbyC5lZAy9vCa0NnzITSKrqogfr0TUIbkGTfpyXgqjJt7RglWbKCKMpbcerhR/nffDv1bXqfRaahc+Y4hehz1B7Oqu5Vm2hcaWEVCChd8d4vwI49tFKfuJ1xyibQS0t7KkWZ53QYEolWJnY4RCf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(86362001)(508600001)(5660300002)(38100700002)(31696002)(36756003)(8676002)(6486002)(4326008)(31686004)(6916009)(7116003)(186003)(66946007)(8936002)(83380400001)(6506007)(2616005)(316002)(66476007)(66556008)(26005)(2906002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEJ4QXRLTGJ4OG1SNmRTTkgvMjFiTGpMeit5ckJzS1N2cDdNb3Z5dmFiYkMw?=
 =?utf-8?B?Qnd3QUhMekIyT0ovV0ZHSzEwbGdWbjFEeHRvOEo5a3BPMDdlbUUveFVJYkM2?=
 =?utf-8?B?S3ltaDVDUmpJckxUbmlNMHRkYXBIVGd6MWE2bnZycGRXZ0wrb3FoTVovYXZH?=
 =?utf-8?B?VjRkYWIxWTV0UEVVblgyQWhvSjlxYy92ZWdkbmdOMTZkb3lTSlk3YXNrUno4?=
 =?utf-8?B?ekhOakVRVzh2aEQ2L2E5RHpIREo2N0FUK3d0Zk5UMHI3VFFFZTRPT2xSRzdR?=
 =?utf-8?B?L3dtWVljb0dOUWhjN0FyU2haWUdnZUN6c2FYdlhvN1gxbUpRU0hiSEJ3cTAw?=
 =?utf-8?B?Z1o2UGJBeEZGd0JSRlVUazN0SUxhY1ZNK3ZIQmxmWHdQTGN0MmM3d0E3VFd5?=
 =?utf-8?B?SDJxTDIvaFpYb0N3bHprU1NMT1ZtSE12SGZsdC83MWpSWmRISXdzdzBjdWda?=
 =?utf-8?B?bG5XR0dRYXQ2RUhIajRBekh1dTYxQlNiYUFCaWM3NGx2bXphc1MrT2pxQlps?=
 =?utf-8?B?ZmZnK0s3dmhUZkp6aUUvOFQ2ZGZCVWgrNDhQcXVabTZ3V1BMc3pJamNqZG4v?=
 =?utf-8?B?RmNjemxIb2diZnorbk1MdStrRE9YdENOeTVKQ1lLQ1cyd3QxckpHTzB1R3lq?=
 =?utf-8?B?QXNvR2NUc0oyUzRXazEwaVJvdVB3L0pZc1BnZEsxenRiS1NGaDhSTE1xbmlk?=
 =?utf-8?B?L0tiWTR6U0lPd3JaU0tFd0V5Z1dOajVzd1Vtdnd1TCs0ZTl6cTJ0VmhnS3Yz?=
 =?utf-8?B?K1lMM0tRVkN4OXpjZjF1R2xDTjBHM2tvR1pWT04xdGJmclIrTzA2endWZmdU?=
 =?utf-8?B?aTZDanBFSUw3Mk0ySnFQODVqcDIwMEJNQWFQZ3RVU09rWG9QWk9ITDBiUlpl?=
 =?utf-8?B?NmVEQ2VETnZ3NitDRHFsOXYrZG1KN05YUzBTMW54SldneUxXZ0RzNjJoZjhC?=
 =?utf-8?B?Y2FlNllSYXhRYzg5UCs5SEptaVdtV3Vmd3RvWGxhRk9BUUlLKzhHVjlmRFds?=
 =?utf-8?B?SWdscWFGNFZPMzVCNDUxNDV6bjBDL2wwNXNBNndQRTZCdFV0NHhTYnZlSEpX?=
 =?utf-8?B?SDgvVnRnTTZ6Umo0N3JJNHJyZFpBMi9vL1RMSEdrWG10bU8vT0ordS9heFpv?=
 =?utf-8?B?OHJHT01OVUxDZ1pVeDBJakFKK1U3M3F3bTl5ZmZPQ3RIZVVydnlpMFJHYXJ1?=
 =?utf-8?B?NGFRR1ExRzkrcUdwVXFVenhvWDdhQ1RMSHhBOWFQVTA1RzBKT1FRQjl1RWdq?=
 =?utf-8?B?UStYVDYwRkpzTmNwTHkxMUVDUkNyUmFmaG5zamZRK2xHV2NMT3dHai84Y0F0?=
 =?utf-8?B?R3RvRFQyVVlrbDkwZFhqTjdxaHp2dHBuYXd0Z3lmdXFNeTFHdi9EKzFmLzFx?=
 =?utf-8?B?NloyVzRDN3ozVEtuU05DQjVCUFlxQXRaUXlqM3N0UENJOVA1NWhhOEVVdkcx?=
 =?utf-8?B?aHR5MHA5YVhQVUdsQ1FUbDNtaTN1VHROZ0J0WUVmelFaMytPNXp5d01VMnND?=
 =?utf-8?B?eW02OTc5ZXBJRVAxOHYyS2g4WXI3QjhmWDJGNVJZcmw0NVY0QzJ0K2JNOW9K?=
 =?utf-8?B?aTd5a0pyTnNHd2ttYzBLY05zYTVtc0JKdWtNS3V3czVuZGs2VUNwMnUyNnZL?=
 =?utf-8?B?a284dWRuRkd5YkV0N29YQ2FkamVZRDdac3pmdGhZS1g2Sm0yRHorQUZvVDlN?=
 =?utf-8?B?MDNlQU82cHN2SE5kNE5nUVU0Z0paeU9Od093eTZ2MG5VbldlMHAyNGsyQTQ0?=
 =?utf-8?B?RnhWTlNPaktFZzMybnAwei9PenZxTERWV1VacW0vVmJiZVRCZ3ZhdGpvTG4y?=
 =?utf-8?B?M2Zjbk9HM2ZEN1F4NTZWakprdkN5NXNKYzlCUSt3azJadlEzYVJIbThwK0JE?=
 =?utf-8?B?aXZudnVVemxOVWliR1p1NmY5QnRheDZJR0tMb0l0Ui9ybUVjbjBEcEEzNFpk?=
 =?utf-8?B?WUxmc1BqRjNmdjlrQ2xBand4MUxQUVdzR28xRUhjS1VXbTR6L0xPQWNoaEht?=
 =?utf-8?B?TUY1UW5Ic2diQlZGbmJYdFl6ZmtSOERqaHJyK3B5SUlwdDNqRDEyNCtpL3o1?=
 =?utf-8?B?Y051dkw5cEYyYndVNDMxbGozYmR1Q2pGQnlwdlpKOUs3U3dKY25OakFiZDhM?=
 =?utf-8?B?Snh5L2xXS2RmRlVWMkI3ck1hYSt2R0p2dEVySHJuVXZBNWY0MHdVaFBVb1VR?=
 =?utf-8?B?Um9iQzBpcFlyK1ZFdFY5TTFrd1FDUGJUQldoV1pRZm1zOW9jK0tFcTR2bE1J?=
 =?utf-8?B?a28rT3M2YUg1TWhiV2JFTTRUbCtIVVFPZjVVdmdXWkRCK2h2ZDZKT01SWlBZ?=
 =?utf-8?B?UG5XZ1d6WHNLTHlZWlhHVjhuV0hHMXord0dLTGIyNDBSeE5JMWdsZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66377a3b-6a7b-4ae3-12c0-08da12364b70
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 10:16:03.0766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjvmbOm0qYlnars7JD7oZ0SPXfJC6vut8cPGaukKmvYhAUFP2+OGGpCi2TSJpdyosCZ7fn7pWSeRQ2rQyzo1ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9569

All,

while 4.14's general support period ended in January, we're considering
to cut an out-of-band release due to the relatively large number of
security relevant backports which has accumulated in just 2 months. By
doing this we would _not_ be promising to do so again in the future.
Please voice objections to the plan (or support for it) in the next
couple of days.

Since it's a little easier to "batch" releases, I would intend to keep
4.14.5 aligned with 4.16.1.

Commits I have queued but not committed to the branch yet (and I won't
until in a couple of days time, to allow for objections to the plan to
be raised):

dd6c062a7a4a tools/libxl: Correctly align the ACPI tables
aa390d513a67 build: fix exported variable name CFLAGS_stack_boundary
e62cc29f9b6c tools/libs: Fix build dependencies
eddf13b5e940 x86emul: fix VPBLENDMW with mask and memory operand
6bd1b4d35c05 x86/console: process softirqs between warning prints
07449ecfa425 tools/libxl: don't allow IOMMU usage with PoD
10454f381f91 xz: avoid overlapping memcpy() with invalid input with in-place decompression
0a21660515c2 xz: validate the value before assigning it to an enum variable
b4f211606011 vpci/msix: fix PBA accesses

Please point out backports you find missing from both the respective
staging branch and the list above, but which you consider relevant.

Jan


