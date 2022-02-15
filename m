Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D184B7023
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 17:31:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273425.468610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0ju-0007v9-Ue; Tue, 15 Feb 2022 16:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273425.468610; Tue, 15 Feb 2022 16:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK0ju-0007tD-R2; Tue, 15 Feb 2022 16:31:42 +0000
Received: by outflank-mailman (input) for mailman id 273425;
 Tue, 15 Feb 2022 16:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nK0jt-0007t7-5c
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 16:31:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c081c288-8e7c-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 17:31:40 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-pcIB0EvtNmejYy2KTLnlJA-2; Tue, 15 Feb 2022 17:31:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PA4PR04MB7552.eurprd04.prod.outlook.com (2603:10a6:102:ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 16:31:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 16:31:37 +0000
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
X-Inumbo-ID: c081c288-8e7c-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644942699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RrkKbgHIc2TJb3YDwe7Ap1m9A+vP/nGIA1Zn3ce45jY=;
	b=iGQNAJOB1iL0rXQFPBaI/C8MrJJ5D/GrD+FFtMG5cfuR5Qp7OfBDj4MRypA3vEGqp+a0C1
	fFAiEVVbM9JiWBQvcq71xJYbchJ8XrL9aZmFDGC7nRnpekRDoLPaf5iIbWXJlf31PF/vbK
	7mhfOs3XC+yMQiVxY7MwpseyR7cQlCk=
X-MC-Unique: pcIB0EvtNmejYy2KTLnlJA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLaUdXysdkQb3IAfcs7uZADVf+LJUUy3lLzk0+lPIISoH2YQDXXx9QCURphGFVfTt7+4yRelore85kvZIu1Dvalc9vl4rknXLdKkazNSvClPPp84FrQTQRCGQaVXlHlQ+XJDhWKJ9J4RBnCHxgocMlwCuYZSiIIJWzWLFO8XklULpklnGR1q/HmL36qWdCVVr3phV+ASetKBDypAS8VotC7poLHbOHB8v4p2x+yUkHYTM2OWCvosQJDILF9JGH2hwgP1ztfpRgwiDrOUegfI1OhPgeMKeDpV1kIOdA9nfmRcAO9z31LX1/zudLi7OGzmH3XviTUUZ5K331P6T9rf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrkKbgHIc2TJb3YDwe7Ap1m9A+vP/nGIA1Zn3ce45jY=;
 b=g4bHWK4I3LqCEJ3KnqTW5mwmEf5ccQRLKioC6MGSU1k/++ZkpZ8J/YBjLD1kb57pAcPpZSP4Lmj7CVGjhqPj22yTXDJjsmBu8/B9/Ok23xQcK6cdaWZ4EJ3j+FiGSszicYNo4H3L9AzbAsD9UGsStz91f2tHiboWAbXfYwxSi9eIpKPPKlkuN2mrwb3pmvTOi5IlAW3OrCnEdSJW46EeVrW50ok0WcR53yGGyWT/Ca+M2IxFSjWBzhbA9+B35ER1mpSJ/53GCyZS7NcNSWxYIut03Vpjjfeml8Ir3XKNhsA56cy5yVMszqeH/nZLp3bv2PQI8EOxShDHRh3QJR28RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f0bc5dd-8599-faa1-ac29-3ffc8250b162@suse.com>
Date: Tue, 15 Feb 2022 17:31:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 64/70] x86: Introduce helpers/checks for endbr64
 instructions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-65-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220214125127.17985-65-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f163cdf6-a21e-4730-d572-08d9f0a0a2fc
X-MS-TrafficTypeDiagnostic: PA4PR04MB7552:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB7552911DBFCFA0CA2AF21C18B3349@PA4PR04MB7552.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JKsksosBcdeimtz0SQVXTJys40Y5RBBRWyGR12gqRrTAjodDZj2nH92ScrCYVGSq6jazu9EYQx+q1pveY1sFOeP2IixjNIvc/Rrq0QP25KKDFu+3jmAsHZYMnoTMzBrBnntDNp+FCWUWsIRL1Y1Nd/1JFFBmxXsuMA0FiDhAnIuYmvgQ1WO1XHHtIMcXnJNOTXK7GMJzKley5Q9q/5UXDY2PyzONj/wC245BD6wmzyswcl/h2NHdGJXNNAZ3f7+MG4BKUY8U6AuJJO1/5aRZI9qG5tJ7bq5ce/wEXOiO2XHzQDpLQ/cHjyHqU3wIkfcN8W6H0DLh+r3jgjxVg4OVCKEwPG8UVlU4xcwPG2+0aRvLWMJvJeKu7fyuXJVFf4yBgcN1okBtuPi3CTKvM6Yibm3Tv0ph5enxrqvO2AmOjiXboCrHfg2O/mcanMQOFXEUuMGgFpSXOrEja1mdPsSqTsidEtaTbDPQSwZNkrTonEEReUk4g4UOh5JFpKHJmk7wLg55UT+2iKCvRlLsI/h5lsR0iiXhAzisBTYv6z1ewTfK3AUdWV9BWtj349E3CcvPl2ldz7xHqVrK6fsK9Q6Y1+Rd+nb32BvgdpQ8G+jDZ8XmFQvq6p17olBpr9c6vyfq/wjbAXCpduA8hpPkG8N3vuePgkwB3a0M6m19diwOzG5Pl4eWwa9UmJoMwVu+YNWa9PYZDrqQta45ctBqr8P7ogMzC9NO/DLetxc/OD76F7nJqwUloq2Iih85eZDowJig
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(8936002)(6506007)(4326008)(508600001)(53546011)(5660300002)(8676002)(86362001)(66476007)(66556008)(66946007)(558084003)(186003)(2616005)(31696002)(26005)(2906002)(38100700002)(31686004)(6486002)(6916009)(54906003)(316002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGdjSEpMWWttT3hXUko4MUJRK2h4b0krQzRXNXdVRkRCVTNrdnZkeVU3Q1hS?=
 =?utf-8?B?Q082TUZYSFFZTVI5VzBrdXFacTBPR0hWSzhpbnVaRk4vckxZb1kxVitweGZI?=
 =?utf-8?B?N05hTHUrTU9YNGdKREllSG95UXBaYzFUSkFkZTQvOXovWUdQMG1zR3NjTUtI?=
 =?utf-8?B?Lys2eGxtWXZXczZTVHVJWVQxdUxwS0FyekNaTnJYVmZ3RjRWejZSTnIxVDVK?=
 =?utf-8?B?bS9ScWxWcm1QcjQ4QWRSL1F1K0o2UFg4UmVFRzVMeEdUbjRFemFReFlBd3g2?=
 =?utf-8?B?ekhCYkNrempNOGJHdFhaODRFTGNuK1d5eDc2TStaRXM2U1krM0ZVSHJuSnVl?=
 =?utf-8?B?SXZpL2ZZRWYyUkY1SHlYenlWTDk2dVpMclBMWkpGQ2xtNG84U2pUeG9mdGtk?=
 =?utf-8?B?N04zWDF0ZCt0dGEvYXpDcjM4eGxXR2RCKzVQUHI0Tnd3dDFJQXNVTTM0UUxI?=
 =?utf-8?B?b0dBcHdNa3R5c05vUGIxWm5qZjBVZnBxZU01d1JkeFdiK3pwTHIvUFM5MzRq?=
 =?utf-8?B?dkgwbEk0MUVtOXM1eW9RRVdXUFg0VXNTaTd0alkxQWQzdnUzcDl0RVpzZjdy?=
 =?utf-8?B?enhsVGhhOUNxZjZrRU1zNm9tVW5HNFptbUgzeXpSVTdvQXhNUGdDQUtmYkc1?=
 =?utf-8?B?aWRKM2Nzc3Zid2ZmMXFEMUpIUW15QWVuK3ZHRTljYXFVUU1uVG5FcFZkTjF0?=
 =?utf-8?B?YS9DSFY2TExFUmhGL0tvRWhvWmRieUN0Sml3cDQ2VUlZZFhuWE16cEdMUjI0?=
 =?utf-8?B?aDE2ZDlqNlFSOWo1aUpUYS9LbEp3MkV4VURXQmpGeEhSZTdsODJxR0dHM2Vy?=
 =?utf-8?B?alNIc3NGa1FkeTZCbmo0c1FxaHNoWlBUTnFxSGRESjhSRnFmUlpoQk0ybHFZ?=
 =?utf-8?B?R0FnOEtZbzhtYko0UGNiU2tIOTZNbHNpd1Z3R0ZNejhSZ3VHMlNzdnJiY3dW?=
 =?utf-8?B?cjNtMndwN0UrQ2ZnaTF3NkdaY2V4VElNR3pWS21ndW03eTVBelBzV1BwTXRL?=
 =?utf-8?B?bExic29JbXoxczJMcjBNV0VlRGJWN01ERzRRZ05NcGNScTd1R1lmc1p0eE9C?=
 =?utf-8?B?U1FCbnorb2hrVDJZKzdHNFlvWjBFb2JLVzE2ZXFLVGVONVdvNlR0MzNmek9O?=
 =?utf-8?B?NTJyRE1KekMwaGNLVzVxVFQ4c2NrUm0yTjlXcjV0QmtORDdJNE9sQmc5dHB5?=
 =?utf-8?B?aGc0TWNYT3liY0oreXYrY3Q0Ykp4SE14MmUzdGxTYkFSZ0dwM05xRmt4S0JE?=
 =?utf-8?B?T0RxRUthYVFoeEhWdjEyNy94UFFmamVwRUNnTklOQVBwWWNKK0VQTXBDa2Qy?=
 =?utf-8?B?UlBmSXhCaGRGMzY4M3pXMm9ITXJEamYrQTlMY2c0Z3pBcFFwTlNXaXdGeXlj?=
 =?utf-8?B?WGZTV3M5VGNiVEE1RUhoMTlRQmhLRVAyY1BiTnNLRGdYYlFXRlNEbmFLWXg4?=
 =?utf-8?B?aEZ4MGl2MGlqUTJidzl4bzBNYmxlNTBkV056Rms1YUdXUmVxYXY0Y3ZwS09o?=
 =?utf-8?B?d29MOXY3VmFZUW56QnlhNGZIeFgwMzJ5eGhOM3pKKzZTYUtPTUI4M25ITmZ4?=
 =?utf-8?B?TDdhSmhkTUtJR29kU0piQmFnbVJwL0tUTWIrZlA2bmdiNU5naGdObGIzZ2lS?=
 =?utf-8?B?R09uR0hSc0krQnNVTXhEelZFREdTVjZFbUx3NmJnWmUzdmMwYml1Slc1aDVI?=
 =?utf-8?B?MjI1akFUWURMTzBYdndXb0wxNXh0bm81eEFLRUZmbnBXSFFCOWx0amRHS0Vx?=
 =?utf-8?B?WTluMjlFTEVDL3pNM0EzTFdTTFJpMkkvL2c1SG5ta0tJbHBJVTVjak9RS3lv?=
 =?utf-8?B?c2paQXUyTzdzQml3YWVtbzNKZEgrNk40bzBQbVFDYzVhTk1rS3Z0RTZxUEp6?=
 =?utf-8?B?QnpUY1lydm92cVhVNmNqOWxiaGlqV1hHdXhnL3c0TEFhUUx1VkNjaXJCNnVG?=
 =?utf-8?B?TVRGbU5FZDlIeXlUMmNYTGF3eWlNY2lGRmJOUy9scHZ0aXgvbkd3Qm9JTHZt?=
 =?utf-8?B?VjNteDcxU2hhNThZL0NpL2NWSlJKbkxKYjNVdW1tbXdEY1dBVzg0SHdkNnVz?=
 =?utf-8?B?RDMzb2ZteTdUMzVGTlVwVEVPM2g5Ni9SaGhQckMvOUplMjFKMmhzRDVYQVl3?=
 =?utf-8?B?Tm1SR2hzbVhWM2hmMDVuMm84c2tINHR1dXh4UHltVW43TUdTUVdvZTNPOEtk?=
 =?utf-8?Q?+aZszRywEn1LQ7He6ghBtJ0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f163cdf6-a21e-4730-d572-08d9f0a0a2fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 16:31:37.1423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mfVBm+LcjAHp1UtNkby3ISEzwiyCi44zybrLY6yE1ECA7ncPX3MertEseukC+zZpLJteC7aAV/Xya+mVV5vfbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7552

On 14.02.2022 13:51, Andrew Cooper wrote:
> ... to prevent the optimiser creating unsafe code.  See the code comment for
> full details.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


