Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E851C6B9B7B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:30:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509742.786116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7Xg-0007Tn-Or; Tue, 14 Mar 2023 16:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509742.786116; Tue, 14 Mar 2023 16:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7Xg-0007Rm-Lk; Tue, 14 Mar 2023 16:30:28 +0000
Received: by outflank-mailman (input) for mailman id 509742;
 Tue, 14 Mar 2023 16:30:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc7Xf-0007Re-Na
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:30:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 860179fb-c285-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 17:30:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB9988.eurprd04.prod.outlook.com (2603:10a6:102:38b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 16:30:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 16:30:23 +0000
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
X-Inumbo-ID: 860179fb-c285-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0BCnd0Qfup0eeH8aYeh8/vlz7l4n3ViuzcakPW6TKngirljpgEZq1KygNm8oUYlM3YVNcPNCuyEV06ZWtRBF6T2cO9tDpHLomlvh16elaV0uAltjH/ScJQnpErOBsHyePT9HUWzk4Z0TQrw6zQy7H46bMrHNq4bMM7nC/umCQyEigBnBMUf6ZNjKMijdLXhS02tUiOr126Pl440tK9fmq9FFC9+DgMWv3D5kNUCNJ35wDOSaoTiB5LoVWm8u8R4a2UcPnDUuSkDvk/TJqsicxkjQeV7T6fYH9dJtC14t0sGmyu5xScsKrPGzid3dFhcrhl+hAxtSbg1Yyf+xhS6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6IKgpBPTrAz3IkXwqbMRA6S10mi0PA8HUg1td/35tE=;
 b=OnrgghwoeWWkWHTQ7wO0gKmQcNSx+fzT3HiNWKQjAQhx+lo1wx7MYf7zKU1f7ic1vYd77AekuzXM1Ss47/E1GnlOtOmVHnoMVmgrgFToxAOOAWSfxORENnwmGQ1eqy5Naq9l+rVFdnH0zp5EpCNn8Wuv56TALYVKKG5s8wowZo+X60MxvYWf+X1MFBdsa+wDOConTXZbRiO4iwfDGUH71jPYYCBMHfjiqVWef1+LEEzSg9/a2EMPGmB1GSwMNXcbbiqPrDq7L6B0+IazHe/wnRVgx+M1+NJqmtUm4c4J8hotMPpNbzvJHryFOjPguQzvoJmE+EhLYx2RnIW/LMq6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6IKgpBPTrAz3IkXwqbMRA6S10mi0PA8HUg1td/35tE=;
 b=VG0BuH8Ejw32Vq2HbkDHtdV43zPqU6VAAazqy1ze2kXGDCqZDX59SwUOHEfafwFmNpDmtZFG/LDc1wa1Du3H6Os3EIcepRc0oEfhNHc/lrUf2EjXcWGrQu+sqZLQdjV4mGoVs44Ymoy+BrsAOlTviXGQoomHSwwV7y6QTOp7ZaoIK956JrDslPPiYc8GxrL7EAk2Yb3uafpXVlIdxnxBtY/pDctipP4FsnWEqY5Gg/OHM3117Hnb1AxAdHV3q6KiZFgt9OPC0P/+rP6UkT6DKyRPRUyab8RXsv/+yZAi9a9i4dPUjkQ+YqH35syFkqgwdKB4bNUZppjQuY1NrgXXpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c51bcc5b-4f90-5651-de3d-df47bdf4a04a@suse.com>
Date: Tue, 14 Mar 2023 17:30:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 4/6] x86/pvh: PVH dom0 also need
 PHYSDEVOP_setup_gsi call
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-5-ray.huang@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230312075455.450187-5-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB9988:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2a8c8c-4fdb-42af-b72c-08db24a9690b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J4je1V3LNtJb7tM8QstvyB1yXpqsai0cXu4vNXOL+rdNAHSoMLfhwYYp2AUD1iurBdBTsLYu921pRk2VmZkCXDEotLjctP7TJQXVJTwRVmtxC2N3QGi7VJJcN+dMsWBH1mywB0vr+fLDZReKYxT4YhfqWhLlAAWJsVQMnSWJrukA8/wM2YuKfOtuUNmBY7lODyuAgFd/5Sr4S/o/n8WWMUotwrfa0awGrd8jiNAXWGapEDVpWtWelnUrV8jGQeiPo5o1W5xjj24mwNcLcWuRdrqBigotH8CebpY6qEiasMx7r6LIkikLnwgviSKlSjAmr0DgAfgTQuva38hhS6y3JeOnXT33O4KkrawzGlCLIV+ICwrdnFItWGSodkh63rIwFTeiJBhuPFys23uPPaq725qnUjpn3cVuitVDdSLdd5PQlE/P7eL9WpSXpuHlp7NZHppD5nDnA5zX4t6K8IGvQC46DLXVhkOvfgpFKsBzgr9OtYZsV5niQ6V5fWk3xsEeo4FhFl/EjPyUw82DaQSg3PbLgu464jQoI6nGhDkLPJTciJAPX540VA9nvsRRSIDWlh1Nrtv2TdNiK4+RfB9cWH3O6GcJvcJ+uDzplA2XbjZqPfqF7I2AIG9TnilWgMJBSb4GBCnk008lnY72UexNROQDiysj8yBhQC+IyjiC3gapOVBoXG0CUzvKrrI4sP+yufub/0UxyJD1l1cCr5697vuVm360QJKinoEPye7TtA0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199018)(31696002)(36756003)(86362001)(558084003)(38100700002)(6916009)(8676002)(66946007)(66476007)(66556008)(4326008)(41300700001)(478600001)(8936002)(316002)(5660300002)(2906002)(7416002)(2616005)(6486002)(53546011)(186003)(6506007)(26005)(6512007)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDBwTElEZ3N5MDBta3dqcUlpeXdSQXFhTE00enlDNmkrWjBJdFVxUkZWNndH?=
 =?utf-8?B?Y0JaRElZdkxVdy9Mb1l1Z05LS3QrTHZodUdWRGQxbDdETml6ZUVtL1E2L1N0?=
 =?utf-8?B?aTVNR2orbjlWS1RoUHFoa0RzRXVJY2t5ek5PbHJ2RDJLVnV1WjNOSEZNUnZ5?=
 =?utf-8?B?alpHRWtpNHdlbFV1MlNCSEtTWWJST21yaEU4TUdIVksrY0dlZ243Z2V3RGZK?=
 =?utf-8?B?c29YWmphaWt4bHFDZVluNkUxNkVaZkFJM05RR20yNWlMUTJIU3l5enV6NDhx?=
 =?utf-8?B?ZWlTc05PMTBRWER6SmxHaVh1WEpCVmdIdUFJcXF1ZXhMRW5EeCtMMzFWM1ZD?=
 =?utf-8?B?Q3Fyc0FNa0FjY3c2MjlldjZ4ei93bVZvbkpnZGpQd0wwa25ReCt4TlZ2UmF4?=
 =?utf-8?B?T0xDaVpQaFo4TURTKzJqdithaVVGN2Q0MFkyZlgzZTk1K3c5WE9Gb09EbWZj?=
 =?utf-8?B?RGFmZG56RmZLclBIZ1lHYXQwRGJVUklXSGd6LzZ6SEFqa2NDZTU4akU3Ynd5?=
 =?utf-8?B?T1U1Vm1KTWUzU01CeEV6UVNqYis2OVd5TkcvRWxibVNDbGhBb1BmbE4zdlcr?=
 =?utf-8?B?emoxUDFvcThaZnhocHRobnlyVDhxMUV6RUNKQmw0NXByWjVvcDQvNklRTFUr?=
 =?utf-8?B?VVF2OHdUcmNBUmJ4dWF0UUw1S1Z6WW1OUU1rM3huUnMzUWcrM2lEejczdFdN?=
 =?utf-8?B?ck1QbUp5ckhVQm5TYVNSQ3VONldoVmVjdVpoNzVEUFo1NDg4NXl2Mk51VEtR?=
 =?utf-8?B?NVJPM3BBM3hLWllBMURYQncrSjNjb2prS2FoM25vdDl0Nkc0NW9mNkZxTUll?=
 =?utf-8?B?TW5TWmdxdG5QYkJ5a0JsdDFpdzBJTzFUNU5DcjYvQjlvR1lTZ2JXemljMEM0?=
 =?utf-8?B?Q0h3cmh1QnVqR2swVlk4SThmaVhpc25WeWxOSUpLMGc0MDBNbnlqVFh0Q2FE?=
 =?utf-8?B?Zm11ZmFiNXp2MEowdzJ6WGNZU0J2bEZIa0x6T2crOXdweVdmQ0d5OENJVVlw?=
 =?utf-8?B?aWJ5bnJqQ2dGdjhMZDdGQUp4b04rNGdCVFNWd1Q0OXR5WlBrWEdDaVFnQ2ds?=
 =?utf-8?B?VHNoeW11NHR3RjVHQjBna1RHbGtzQWVUd2VQZkp2ZjRqKzNFanVJcUVFQ1Zr?=
 =?utf-8?B?OGtoYXlUb3ZsaWw5Mjg1ZUNMRDVMWmdyem9iRklhZVo5b0N1MTlaejFYdmRw?=
 =?utf-8?B?bXpHUWtaam4yS3F2TjBoWFRmMWZZZS9oNm9ZM25pM1lXYVVHbUtlUmpmSEV2?=
 =?utf-8?B?WFg4QVErWkFZQWFEcTAwNFFsbUpHZ2g5QWMzOTNvUmJjV0p3NHdvWkJidEdh?=
 =?utf-8?B?VzlIZnR2SXlCQS9ub202VmNIQ1NLZUc5THNjcmpGQXVBM2FiNm1BTkVXVmpN?=
 =?utf-8?B?YlNsbXhCaEJYV25oMTVOeFFlQ1AzUGV2Z1RQMXpZUHRZTmp4MlVtMzEzTHVY?=
 =?utf-8?B?M01MaTBTZEJYKzdLT3UveGhpaXNKK1l2a2VlK1NZYzNWaSt4VE1zdlgvWnFt?=
 =?utf-8?B?OS9nWWRYL2hpZzdQUC9wWkxzUWo2UEt6M0xKVWk4MFpTZnNJOXR3b29Sdll2?=
 =?utf-8?B?UmpiS1UrNmxxcW1iK216L2RndEVJekdBMExRcUJOMVFtK0YrNFF1QVB3QVll?=
 =?utf-8?B?akhHdER4SnhkU0NoQTNiS3V3K2VWY3c5SUZaMk42WG43bDM3aGlQTE05YnFN?=
 =?utf-8?B?N1NzZVdsRlhmWDZZUFFiRytMdldpbXUyeVFhSUdodHNEM2hpNnJZSlpqaXRR?=
 =?utf-8?B?QmFzK2ttbld2dkxiVkQ2b0lDL3ZWUmVrZnJqZklaZmpHTWJpTWVSazlSVEF5?=
 =?utf-8?B?d0VLZ2FIZlJqSEhjM0lWLzJ2Vmpva3JnTmpnMi9VbVA1aVd2Y2NCcjR1UkFZ?=
 =?utf-8?B?dFlZblM5c1NqN29JMkcrUVhPUzhQTGh3YXZMekxrb3hYcG1oUkFZeHJ5UnhD?=
 =?utf-8?B?RW5TKzFaRDJBL3loVzhvNXpVdWwzOVZ1ZmpwNkpESWZncUptaEFqakp4WHM5?=
 =?utf-8?B?SURaRlV3MWxObTFQTEFnekJkTnFLTWsremhxNE5zMXJ5SFN3NFBUdHdKK3Ar?=
 =?utf-8?B?dWQwQUpPV0pydnlWZ0hycEVEczd2ay9KTUkwZ2lNWFVpYm45ZXQ2NkFRTmVr?=
 =?utf-8?Q?S5vWGP/E65y50Oav0It8tInTs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2a8c8c-4fdb-42af-b72c-08db24a9690b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 16:30:23.5224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eB3joeQB7eyQ4xWNZ5qTUOaYAGusQR0InHSOvc0nndXY1EmaxeetRpmbnSyOf8dOduie393ZfCd/R3tAdC6gsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9988

On 12.03.2023 08:54, Huang Rui wrote:
> From: Chen Jiqian <Jiqian.Chen@amd.com>

An empty description won't do here. First of all you need to address the Why?
As already hinted at in the reply to the earlier patch, it looks like you're
breaking the intended IRQ model for PVH.

Jan

