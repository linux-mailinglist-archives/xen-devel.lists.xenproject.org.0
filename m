Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66134802C6F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 08:53:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646544.1008894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3lH-0008IC-DQ; Mon, 04 Dec 2023 07:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646544.1008894; Mon, 04 Dec 2023 07:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3lH-0008FW-AR; Mon, 04 Dec 2023 07:53:03 +0000
Received: by outflank-mailman (input) for mailman id 646544;
 Mon, 04 Dec 2023 07:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA3lF-0008FO-PJ
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 07:53:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 254b8fb1-927a-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 08:53:00 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7504.eurprd04.prod.outlook.com (2603:10a6:102:e6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 07:52:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 07:52:57 +0000
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
X-Inumbo-ID: 254b8fb1-927a-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4HGqIh2IPjhAo0CWHlkREC3qfhh/1F/M6mgW4oGPS9jiL9ud76JgLgBmw03AWpDc3gdPu01K5pfyMbcDNkIFYIdeBpK8nS2PHXhV8T3t04jNjJLaB/gM2rGR7OxpvZM+wZpskw+E4i4Dx96wV9ar2w6xqYta8HBNlDq1guDSfelhPh2BkxYWrbChG8U9lja4/HBtthB3QbtgEjO+G09bJRQOhvvp1HVuoNzfu5kSYyMZ6VJLChSCkVdTCHlIoX0dYHXLPJzg3Gl6A18d3RvWv314qDLy32PT/JyTFSVNrd6p6lTstY5lg95meooLcLjNv50bsF0w6hDycljIQuu3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNSywvtK4j90I+u03gtvTFQkrMAeUZzFaaF/i48yG9Y=;
 b=jUbXCnuEmYefzukSAOpoBnkS+G4sRha/zFDpq7oSg6g/lLlP8D1zEFb7bNs7v0LaEKr7xfRvqw3Do0fGbZnjb9pCnl38AXYG5u02gpmeBZ8r/VDQ5xeJIRNpgiC1nOPv2ZtPaww5Vmah7hbpbBngt+LDLijQ1KtBl3AlYL6j/MMAoMRSLL3islD07T3shIyFxLu5glnNRAc/BvlWvW/zZ+mNyLQvmbfuFqQ7yH2m9uCxsjUeLp+90/KsCyxG9H7pEcPYKJnC8ME/U61oMCoxR1uJuZRLTVYavq7IxG8idydhvaE5k8E6wCzGqhl6OttrQCjnEVsa9VoalEO1Rwd+ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNSywvtK4j90I+u03gtvTFQkrMAeUZzFaaF/i48yG9Y=;
 b=d+zrNYBxYj1mPc78Bsb+BqPYh8+2e4Grx5q0ANGsT/vC0cpFYr/9AUrGTjUYlv4Za/ZILhIWtQ/4MxSt6Wzk5tzsdPMP8tfLgv6PVFNUCfrDD9y0g+rHX6uLJEO7UKThPsAAwZ269C76O7GEdQeoV1NNU1bW3jBTlGYc1TMDFFsTZmq2qbh7dICb39tuvRB4oMUeVOG6DebpDxRe5IB8oEhSBD+oZxLQekW6FGnhmtszUjGPporHuf4o7G9U+ghXhROsUUHCFe0GV7H9XWvYkf3OU6633yDqRI+YoHRHqMBxCGRgDZkT9oORC9JsrBHmha1TeogCX3C+2n6eyiDkOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12a6db86-ed45-4982-94fe-1bb1e4477a67@suse.com>
Date: Mon, 4 Dec 2023 08:52:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
 <de5e66c790c9fc5e7f668f06826c7ee781b6d6e1.1700790421.git-series.marmarek@invisiblethingslab.com>
 <277f832d-20ce-437d-a7a3-7935aa6cf34e@suse.com> <ZWqfiN+sIOMHoB9m@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ZWqfiN+sIOMHoB9m@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 745cc759-f765-4437-e3f5-08dbf49e07bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JmJ7FaqMyRHQ89v9ZlTRxsByMaEbFs9N7+1VHy389knAHnYjbiO0T9lnnV+eKNPDOeD4aUdxECcqhPxlxrwU6riPbXLVDkbZ5PkERN8fQch9Snw7/UoXwsOYjY7l3/9F+PW/fuVTyHAdWrRJ2SZumgMw0Zhwr7zYO0pwoqTvBAGX3JhGBCg2+FKPP/Kc+P5MNtm69VLN2UGjFjmxeV5+LA3NvDcBSUGrG1OyXl9TP95vnsfk3MrlM4Q7U708k5LDCre7HMk8UxmRl1bZoNhyek4zRTSuq2yazlUFwHE8uZGgseKPWAqi8m+ijhiTcRgUfeqH5RN1OySmo+SAgQYXwU0P4b3adIZy+QOMLbmikXc5dtl3jMKIkhv2Sxc3448pZHCWrb/3+nHloOxFNfLukl4U5I3qb2iHzTtp+fm1IJ8xo4vlB2MbC2yXHgFRiOsQPAb8ECl6+R/A6wSnNScoVx7/jcCRks8fLnC0cbCZfLyImnYE269tTrb++rnupsQkvno/yzJljSH+quOZ0Tph4a7xT58LWCBE9M9vmni88cD8B7ZdjronOHxMpFno+JulZ5eEEbQ26IjK/oUvoXCsaMENQkUd/XzrhAgAeh/9ac7x3271T987b5QhS8R16onlhl5cAOiI9v+oLNiI7198b5QPPzlKgFfYKXRa/iocDXmdJOZOAtEzRvBArAujczji
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(366004)(39860400002)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6916009)(66476007)(66556008)(66946007)(316002)(54906003)(4326008)(8936002)(8676002)(31696002)(86362001)(36756003)(6512007)(53546011)(6506007)(478600001)(6486002)(2906002)(2616005)(26005)(66574015)(83380400001)(38100700002)(41300700001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVN2Z2lPem5GWEdjY3QxQ2RvTUw1cEJBME1HbGovWDVRUWpUTHBzWlRLTEQ5?=
 =?utf-8?B?VlJaTGpZNzZ5T04zUFlSOVpkQVJFVEVqbkt5YmtxK3NVRFdyNUhZek1WRVNj?=
 =?utf-8?B?WVlXa0VQaktvUHMrNzhuTUdSUXZORWNaRWpCcU9UMW4yQ3ovRnZkMTViTFhV?=
 =?utf-8?B?c1VacHRMZFJQRmhYcWdBcTdJbnBWWDBWVHF2NDFuVittUmxoY2Q5ZnI5QWlF?=
 =?utf-8?B?TjYvZUFiL3lCanl3VFl3Z01BaVRrR2lEZDZ2VmNDOHBSWmRwSFNLQVFUU0ls?=
 =?utf-8?B?UkEzcm9GencwM3lYNWF0aWxueGVBZTVtN09OS2VWVjV6YjBGbGRqUkthYW4w?=
 =?utf-8?B?Skk4T0F4NS9adVJQcEVrOWFRbTRSeDBZd1N3RURBeFJ0eU5FSXJkSjFkcTU5?=
 =?utf-8?B?bGhiN3hyZHlQckRmSXpkODhSM2VXbVZkLzFkbUVCV3Ayc01lUXkrZFJYRUxa?=
 =?utf-8?B?T0MxODBSdW9xVm9lTXBLa0I1VzI2bWpZUTZSbytTbi9vWCtiZE9qb0NKUmhU?=
 =?utf-8?B?UVVHb3Z0U1JFSzFtRFdFWE9PZHRaSnh5SkRRQTVDQ01QYlA0MnNKWmhtZWE3?=
 =?utf-8?B?RTFOcjBUOHJjd1JQUGhJM2luaG8xNmZjeGtFRndUdzYzMmJXWjZ2bVhUckdD?=
 =?utf-8?B?RHlQQ01nSG0xVE13elVRcVRNSHBZQ3FGaHBiNHhPNUZhRHhhZkMyODdVTUZl?=
 =?utf-8?B?RVZXUkVkMzNSZG5EeG81WUVkOEJVdy9IRUVzaGlyMkZXeEpqaTBaSkdSbW1n?=
 =?utf-8?B?UjZFdDdCekRjZnhwNjNMZDFQdG01UzVIUjc5aVpzdmVqV0pTZFlrbDNaR3Nz?=
 =?utf-8?B?Y01XajNKY08zeGEwU1hnbnhPc0hvQTFnZGlYTmRRTzNpL3FkVnVsOGs4OGhV?=
 =?utf-8?B?czkwcTgvK0J5WHM4MTloK3g1T0VJTmRQWndsa3pRc0VKa0JJeTJzOTZzTTcw?=
 =?utf-8?B?TkdTZjRGUzdNVzBSZmRkOXp0NFpPMTRwY09Ya3hQbzlrSXNubXpnVFlRelpm?=
 =?utf-8?B?SWlQSEZ6TVdkQ1lzdCt6cS9keVpod2tDM0xvNWFMaDNxSXRtTTZoV1hmZlh0?=
 =?utf-8?B?cmFTRGwweTlUQ1QxYWl2TWZzWXR2M1VWTFVQeWtOVXJ1blFSV2xRTmhjSkRZ?=
 =?utf-8?B?QXRIdVZQV2V0bnZLTlZ0TW10UkFUaHdxd1pmbXhRTjZDUEEzVGJaaCtkRjds?=
 =?utf-8?B?VHZhSFJuU21EZmtabFE3eSs4R3A2MmVpQTAydG1oRFdMTVVpQVVZUnNYc0Fs?=
 =?utf-8?B?Q0dtNnFEbU1hd0NMUkNGc3hJV2tiMjBhR2tKcU5Ib1FTTVBLSTVxSTBoN3A3?=
 =?utf-8?B?VlhybXpqUFcyM1B6cTk1bTVkU0RaWnRrVVl3cmZuME1sUFptZHgyN3dtcGcx?=
 =?utf-8?B?MFdTVkdEVFoxdG9FRjZYaElLb2EvSE40aVE5TENpYVVkaElXQ3J6REo5bDhK?=
 =?utf-8?B?QWJEODJZTy9tYVR5d1hRSW45cWc2c3FKanFUOUlIcFd0L3R3V1NIZGFYdGEw?=
 =?utf-8?B?VmEwNkNoRXZZY0FzdXdSUzdsazVtS2kyT2M4WjQ1bFA0QmRWZzNFSlpjZGN2?=
 =?utf-8?B?UkYzZ2V5cHNNd2xxcS9pOHQ5cTROUEp2aEVxTG9VUXlPS0lmYjB1c2hzRUl1?=
 =?utf-8?B?bExDSldrc2Njajc5THZ6QlIvR0NvRi96UmhmbXR4TkNKclZzdHo4cmlBUC80?=
 =?utf-8?B?MklLMzA2cVR5dVpDcmFvSm5ZY1J1YzBxRDNtRW1vVURnWVdIRWhGb1g1ZWtG?=
 =?utf-8?B?V0RsbzlCeEtjbU4vRS9wNXIva3A1NXIxeEhFRks2OEdZTVp3N3BtSENyWmNw?=
 =?utf-8?B?VFhZV1EvK1JRWmlOdjJ0dmtBOUJ0MU41cHA3SXBnSi9QZnJHNVB3VyszOEJR?=
 =?utf-8?B?dUdFY2dJYXhnN3lqYlBPK1Z6WDVVWEo0R1hlMDhyZTNYUzdPL1kxUG8xUVJR?=
 =?utf-8?B?RkJuYVVha29Cb3ViT0pqRDU2UFY3S0l4clltMm9HeDQyb0dyT3VIc3pkQXlo?=
 =?utf-8?B?QlY0SWU4azVSTVRFdDJLcXV6a2ROTGk4R2ZQM2R6U1pSaVNodE5SSFFXelpV?=
 =?utf-8?B?MWF1dTlvZXpReHZ0TDBRU05keGN3aVNvcnhOQVRwTUpUYjdwQUpQb2JEZWI2?=
 =?utf-8?Q?CCTQdrFxX0pf4u3mm14D775GY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745cc759-f765-4437-e3f5-08dbf49e07bc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:52:57.6217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oujEegND2qpmm+66gt8QWBIIG5F1o2aeVsV78LxXzgeAlU7UIrPABhb7Q6HzY9/rOVvqUaCmn39EMagGiRQLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7504

On 02.12.2023 04:07, Marek Marczykowski-Górecki wrote:
> On Mon, Nov 27, 2023 at 06:00:57PM +0100, Jan Beulich wrote:
>> On 24.11.2023 02:47, Marek Marczykowski-Górecki wrote:
>>> +    if ( !msix->adj_access_idx[adj_type] )
>>> +    {
>>> +        gprintk(XENLOG_WARNING,
>>> +                "Page for adjacent(%d) MSI-X table access not initialized for %pp (addr %#lx, gtable %#lx\n",
>>> +                adj_type, &entry->pdev->sbdf, addr, entry->gtable);
>>> +
>>> +        return ADJACENT_DONT_HANDLE;
>>> +    }
>>> +
>>> +    /* If PBA lives on the same page too, discard writes. */
>>> +    if ( write &&
>>> +         ((adj_type == ADJ_IDX_LAST &&
>>> +           msix->table.last == msix->pba.first) ||
>>> +          (adj_type == ADJ_IDX_FIRST &&
>>> +           msix->table.first == msix->pba.last)) )
>>> +    {
>>> +        gprintk(XENLOG_WARNING,
>>> +                "MSI-X table and PBA of %pp live on the same page, "
>>> +                "writing to other registers there is not implemented\n",
>>> +                &entry->pdev->sbdf);
>>
>> Here and above I think verbosity needs limiting to the first instance per
>> device per domain.
> 
> Is there some clever API for that already, or do I need to introduce
> extra variable in some of those structures (msixtbl_entry? pci_dev?) ?

Sadly there isn't, and to be honest I also can't really see how one would
go about generalizing / abstracting this.

Jan

