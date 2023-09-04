Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22BB791946
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 16:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595263.928769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdA8g-0005ry-0C; Mon, 04 Sep 2023 14:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595263.928769; Mon, 04 Sep 2023 14:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdA8f-0005pp-Sd; Mon, 04 Sep 2023 14:01:13 +0000
Received: by outflank-mailman (input) for mailman id 595263;
 Mon, 04 Sep 2023 14:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdA8e-0005pj-HV
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 14:01:12 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20626.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80531bd9-4b2b-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 16:01:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB6895.eurprd04.prod.outlook.com (2603:10a6:803:13b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 14:01:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 14:01:07 +0000
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
X-Inumbo-ID: 80531bd9-4b2b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFrsLkDkIHDXnoKAxscV846Kq/Nefs75c8VHF+3m+sC5OWGYqvsMH1C68LcM9Q9mjYabjUbphQcouuKEV5ds6QUAn3UDmcmjSRFQRUBK+9QHJtBuleoqNnAH+MZgHT+6GZkOAts3bseyE92yaIX2Mkq2EjOAoIm3EbjIcvPTeSrBiJosoWDCA9GjeRgrBwnSwlwHdwHCylcKjENvT2QynjQaSq+Gbe13s42NymYHWTxZ7KEAmUv0cwrHZB0V+h0mZQAA4VMuEwQQS5S5Y46/15kWnKmrOrxg70ZYpecXFDP979OxvVac85EvNfkiMYJVlEPC9lUC4QH90W6fxKk/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z6URf7VbHHuZ/hH5Ul8lpeTtPS2w+QrQSYC9K0Ba+g=;
 b=KiBNZqj+iZRfyizKr1zmwHmiyEO5vO3xu/vCZZIt81WafeN65t64TIydDm1GUxGlnuna14rhXGNv8IIaJKG4E0EIGTwpsxloeCwa/pW7MB8MAfQj0NxbcNU9srob+PhQkIcKL3fC7lpjeyS+EwgIR930Ll8+d3GdJjE9JpG/raJmamm94IlhbOvJLuRJt+t8DCKSZl0AM8YhmGmL8lBVNLcLigJcwmCKjdbB2Wj3eWtxMQslPKrqlc4WuaHSKnAlYquB+d8yXyluXGSd27FOB/LV/VAK6q+ppUqTWozBQ+juvYcRDWx1mQ4ob2odYqVUFWo8kbpjxALhQUCn6+fhiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z6URf7VbHHuZ/hH5Ul8lpeTtPS2w+QrQSYC9K0Ba+g=;
 b=xQim64bSgp46MwWrw4pWLESl97W1JJ5H0XEPg4NDawKppg1PxdicPqGecHehy5EeFNuKLOtTM3MI9Pq8EJCso+c+PWIwLRBkzpsOcn5/v5X0w84G7ylU/Uz5mNI8JN22ME0csWBlA0DBPNs+cTat/gNs9n04joGQDP8L9YeaD4TEWUc4YrVUoMTGKklzw+GuH9BO6jvnbiiMXaWephvkK9WBuVjmIpsLgPpttx0rXN6gt7CP5nxAztSkXKP84/DihxJxrthP0PfY/Rt7+865/iMV7S3Q5DMOX2G1MDTz9ttiXpi/Fs0qa/vHE/YLe9qFlSGnvIP80q1FH1B9mFvXbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03a6847c-95df-696c-5df9-53af425795e2@suse.com>
Date: Mon, 4 Sep 2023 16:01:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <56bb2024-dea0-79e6-6a51-66e6c35a2733@suse.com>
 <7D7DA9F4-8B0B-447C-B35F-6BF53E5D0E52@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7D7DA9F4-8B0B-447C-B35F-6BF53E5D0E52@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 51dd91ef-8c4a-4061-57a7-08dbad4f628a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n83IzBVkYw1lro7ZljdchVB2BiZHOtGk/JQpH3mnr5P6WGAFouvx2e6jnYC/KW0W4EfifknMvMXHakChtgV5gHFabdZ8F70urFseikx9Rp9MuJc5syueJU1uABlFEuTh1ETSFRrQTgbl7e0zsbBIyPVjEyyHeENbhNHHGXESNTsAuaRJAUVYXo+btAUs5QGJTVIjAqYMjweNgC5CAaj3x0mkO9uCxhV2yE6d+HBKy+DdtybR1benpsQsYsWsjPO+cbviNETOz5/2Qsi92tafK5rS9ikQd4mZIWJdE93V2sVAva5m5xIIbGqdspGy7MG1QJdjB0hdpQ7hQgRP2gxaBBmQvp2PbJfWgVvuTLj5WdEg5FCzxaGo/p4lcNXxs453QC9NXY/LwyEDDb/MBsGqjj8SIZsX9MJFq/IWjHhsuk0I+YjwbQmjaHLewzrNr9bNu7E/ZjvRJqJVxRTu2R3BqUY1dibMJatoYiCCGjN1y0EGKixrRCDBy/JfrvVkbIGhKP9u8TVD4NH/HiEXJoSoDM/aZDsPW3x/xqWZEZeJ36sCoRLmO6K4TJoWgKwk+E0plxiWWAODzOhakdJAJIONJo4+eAiU2jiA0J6NISCcN6TkSMikbW3nfhPLzBNqeE8WivGw+JR76lBZrycOhidK9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(366004)(376002)(136003)(346002)(186009)(1800799009)(451199024)(2616005)(478600001)(53546011)(66476007)(66556008)(66946007)(26005)(54906003)(6486002)(6506007)(2906002)(6512007)(8936002)(4326008)(8676002)(316002)(6916009)(41300700001)(86362001)(31696002)(5660300002)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NC9zbFFGemdBSk9YV2thdlJsNk5Eay9aeldCdnlQUy85S1hhdXpBa3Nzd2hV?=
 =?utf-8?B?NVh3QmZEOHFmYlp1VU9LVU0xWG1hbnhHRlEyYnJjdHo2VmEyZkQzbWlpc1h0?=
 =?utf-8?B?eEY0THRwVndFVnp5WG5iNkdUTmN4VWtrTUpkN1FjbHpJQlR5dnZBUG03eURG?=
 =?utf-8?B?ME9VSFZKdnpxK1VJOWNsV21BaHRzV0FWQ3Z2UGtqNy8xcmJLQ3ZuQjY1TFZ1?=
 =?utf-8?B?V3JWK2NHN0VNSVFrc3Q2UEtuUnp5K3JWeU0xYW1teGVTYkdqQ2tma2Qwblc1?=
 =?utf-8?B?UDJZam9NOXRvancvQXdsdDFUelovMjg4WDZhaVBvK2cyU1lpby92YTVRblJq?=
 =?utf-8?B?c2FHWlhpYzVhbWFMUmc4YXordlArWmJTK0FtNElnRThydFN6aTZaZjhXeElP?=
 =?utf-8?B?M2k2eUdiMnZkZWlKcSszcDlaU2FDZHdGOTlZREdndTB5UWhGNjJIRjRxVnRn?=
 =?utf-8?B?VEpxTlJlVEh6YlllZDlUT1Y5Ui96cENva0FVTW5iTkt3Y093UWo1R0Q4ZTg5?=
 =?utf-8?B?aXlBL2RoeDJ6cDFnNnhXajNvOGlUZEpGL0QycUsxa2llc2p2QVhzT0FHdm9P?=
 =?utf-8?B?QmlVYnVZMmlvSWlxV0Z6U1NwYlgxOEVYaWluRjZOeXExUHZrY0tnQlJ3U0Vk?=
 =?utf-8?B?REppMitRRm5PL0VCQU05UTRKeDRNS2FDVHVJSVlNT1pVeE5ScVVmazN1VDBi?=
 =?utf-8?B?VS9GSGdETlM2b0pLejRpNnNLVHpuUHM4cjJxZkh2dG5ScmZzcnBuVE00TDhu?=
 =?utf-8?B?RjcvNTZhUGdMRWltdUFlTUp2ejRBUmVYYnEyL1BxbGRLSE0xYlExRkdHQm5j?=
 =?utf-8?B?SXgxc0o5QzhsZmJlcWJnd0dURXlldENmMnU3MmJvandRYTdHenlKL2t2Nytk?=
 =?utf-8?B?UFI2dlg3V2tDMDVGak95TEtKWTA0VlRzeU0zdDBpWm9LMEd1SnFhUllIaC8r?=
 =?utf-8?B?ZnJaNXdPTXlNT1RYUWk1K2ZVZTh6cEtKbFZOUEJlOEFPNjRHNVFqUWczNGtD?=
 =?utf-8?B?NE9IQmxyY0c5S2tkdlh1MGxIV1AxTnhaTTlZUTkzcGpzYXRpNjNDOXI2N21j?=
 =?utf-8?B?MFhSbXJWL3dUR2J3eVNKRnBMUXBjV0ZsL2greG5NTDRMVlJYb2pGSDNNMWUx?=
 =?utf-8?B?amllMmUwMXZaV3hIZmF5a3J0ZHJaUUJQZEFqbWZJZjZhVUlxRS9OWkQ2SWVz?=
 =?utf-8?B?TzB6cTNBNnVwUUFqNm5neXVMdEJDdERwcElrMHZlaWpwS3BWS090eUl2SVM3?=
 =?utf-8?B?K2Eydlljcm5zVFNrQkIrUlNkZXpOQ3lqZE8zQWQ5NFpNSm01dXg1LzF4SGZF?=
 =?utf-8?B?S2wzR3hyL2htd05FT1NtelhtdlZOQ2hLbWV4d2FwdkxWT0FFWEJxZGdtc2tq?=
 =?utf-8?B?dXU4QVBMOU9TNVpqUHVqclpzUjJic0paL20rVGhtanZpVFJwNEtCWTNZd3lv?=
 =?utf-8?B?cVNEaW0zSmV1ZzByQzVXSnhNMTRvS0g0UmtHZlJuZzFvRCs5a2pnV3VOSkQ1?=
 =?utf-8?B?eWNIRkJFTlRrYTdsc09JbmxwK25HaTBFeTg2V3dJUmYvWHNpOWNWZ016VlNr?=
 =?utf-8?B?ZUIyejlGM1E3dEpPTFVXZ05wSFFwVkczMFNwRElLQTZ1ODV4M3FRbmR3RzEx?=
 =?utf-8?B?cmFwTDdyNjk4RkJTQzlsSGFFdEdtWVowOFh6UVR5dUpJcTUyY2drMFRZQlVp?=
 =?utf-8?B?T0RvOFQzUVpXdmsvako3TWtLc09veW1ZOEtNZzdOaGJxNFQzbGRhS2lFM3Yz?=
 =?utf-8?B?bGhNMkloSFk2VDJMeGtUY2c1MCtOaml1aXF1T3B1STd5ek1RaUNUbmtabEtC?=
 =?utf-8?B?SytLZ2FYaWRPZ2JOZ2JxYzhvLzNQTDNWV2lkblZqMkNzSFZzY2UrV08zTndr?=
 =?utf-8?B?Y3ArSy9yaWdZY1FERUlvY3FoMFZIVWRQVlBwZjhEMEtUR2JHSXg1UTRWZTFm?=
 =?utf-8?B?ZUNibURBRzVnTkVBSTMxVi9yR1p1OTZVWWNab2p5dlFISHdYdzBibmxlK3dp?=
 =?utf-8?B?cnFrTnFCMFR2QXlpbjc2SFlqUzZ0VEpWRXFQQnhCVDY0c3dnNUdZOXNyKzgx?=
 =?utf-8?B?Sk5UL3NhVzlFS0F0RE8wZHRiemFia2VqMzBvMmJFUURlV3lGMnI5WG4wMUw4?=
 =?utf-8?Q?jffWEKK8da+XqWZ37QMrIsesl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51dd91ef-8c4a-4061-57a7-08dbad4f628a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 14:01:07.2016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vElnbUecEHqqtIHmVf/m1Ow8Mr9/DxTT0y84ylgv4KY3uBFSfPiZBj4xvOY0Eh/nQ0a7baZx4ZWqVBsliyYEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6895

On 04.09.2023 15:42, Bertrand Marquis wrote:
>> On 1 Sep 2023, at 09:26, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> This using a GNU extension, it may not be exposed in general, just like
> 
> Nit: Missing "is"

I would guess you would want it added as the 2nd word of the sentence. If
not, please clarify where you think it is missing. If so, then I'm afraid
I can't parse the sentence anymore with it added (i.e. there would need
to be further modifications, e.g. at the very least "so" after the first
comma).

>> is done on x86. External consumers need to make this type available up
>> front (just like we expect {,u}int<N>_t to be supplied) - unlike on x86
>> the type is actually needed outside of tools-only interfaces, because
>> guest handle definitions use it.
>>
>> While there also add underscores around "aligned".
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> With the Nit fixed (can be done on commit):
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks, but I'm afraid I can't take it before the above is clarified.

Jan

