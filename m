Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011F87F32A2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:45:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637916.994004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Swa-0000vr-Cq; Tue, 21 Nov 2023 15:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637916.994004; Tue, 21 Nov 2023 15:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Swa-0000uM-8o; Tue, 21 Nov 2023 15:45:44 +0000
Received: by outflank-mailman (input) for mailman id 637916;
 Tue, 21 Nov 2023 15:45:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5SwZ-0000uG-2E
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:45:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 060e71b8-8885-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 16:45:41 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7509.eurprd04.prod.outlook.com (2603:10a6:20b:23e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 15:45:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 15:45:38 +0000
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
X-Inumbo-ID: 060e71b8-8885-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKp5jXSxluM/GcjbSkj9Wx1FaZGQFe6KLv+//VBjGc+Pse5oYPapvzX4wBcrBrusTUbBnfOi7ZQI7J7d0uZ2CaJdX5cuovFd98By37y+UMEmJA0Dq9PA6HBSFTpL/mUQzuFq0He/+cRVdk7KojCZJ1JJt5OliJZ7i70i4JOHxLRnk7PYvNmpAvj0lYqsGDXXaIttzTm5mA8N08q3Hu8hg4eHen19z40fbEhHdTQ04T8t3InUIwWANEJlGYZx1uH/THVz8ZB8jtA6lZrVo7jMb/uYsqWQJICn/ad2ubISuWslQjhcb1dPIBN+Afxe7teEa2Xnan7F6vJ/8CSu73tZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h03q3jSbkxkSIBmuV+w127ee1i2542UYiGAkGRwVJno=;
 b=UBDTms4v/RyZ7rUncGS655HNcPiXincyiQM5C9sFML/hSpywiKm5Ob6PuHb0p4p/HBz4enmny6NRi5Wr7poh6RRZfA9RyJpNaAIuh43G42uWqxUKel4ngbn3aLziDliQY23L0EWW0hXfwyRuRi5KkZerEhboYTfcl16rnrFFvZ5MidWWq6JwAS9XnT2qWLXU5J4MX22ppDiCrxkq7fC1rlBxfRHPLiJj8s+QJfKzzjrQo+VsL5wlI55JLuq0mz7TFJp1L+u4HmdKHFaO15BAS/NRykLqJw59LXrgE7qCIpx6OnHbdDi8VVvizXiPsQr0QcY0fCYImG23Fi8QDG198Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h03q3jSbkxkSIBmuV+w127ee1i2542UYiGAkGRwVJno=;
 b=zQGmAITJ2AeYO0AmC5gVf+4cMaHX3BUx0wpOwkTV/qJHnmRUcjeBsEc0jptCuaCJoV1A7cDtZSV1m0EO2ruFed7WZb2HRtUHh8brvC+HdWR+tRQFmC0eKcekVSdB2PuLQ2Y47mB+D5li28r1kjfaROYiP10GYPUvAixiD2eXYfO2JYIOKdI/BJ55OGLo6QXKxuwK9tT7Vv0p3yP5zDGQpVNti5XfnJlnPpjpvyB9fI8lDY9KwT/3BV4MXLJcUqpFCNzTKhL/pzV3Do6RljdgN+okqeyP2o8AAdQ24c5wu+Apz8K5uBdNMznP1NzS8JGCJ+tox+E7hU/rM86XtLGMIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2702d1fe-1f72-4ab8-a7a4-902dd0e2ca99@suse.com>
Date: Tue, 21 Nov 2023 16:45:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/14] xen/asm-generic: introduce generic header
 iocap.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <3f6a80241a2c98477eaca5fa3bf80ff6c0df3f39.1700221559.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3f6a80241a2c98477eaca5fa3bf80ff6c0df3f39.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0422.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 73aa0536-d31f-414c-59e1-08dbeaa8e90a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4ebbkCuUx9h9BwdBx2AxRs0+a4X6kGfcsTbBgDyw9vR5MUuPHmj8l9GRrMln+9MVY50J+rXFUgx+cYcIq/PA3ib6BJxmTn+ZqxLc0MnVxwkqu1Nli8DjXhE2DrK2nzNOqsRpJpwiO0Xl1TRH+fjvOxlaqO49uD1VE4hKM1BY7cV1LIlpx0fMeqfbpcwQ/0qo3Ko7X3jH4DVowfi3g3SUctPGE1l+zFdYYB/rUrKS+UJ6UZHPP72x1EJSKEmVsIW9gzcR/FgtWnngL8R3+xqJSpsXoxNucOyA557G4jIVamu4tsj95IscOAIMgUzSCkEsZDixyWAYQorjMElPNzlwEYobtW0MInHZ7CC3cDkg4riZh1zSxEOGSKP+0VBktJwPQGSWmAfYcpbQs+FijDL4BSSD0rXGi7I4I+QfG9qU3jHoBFRpuUpXNNJ4lSLYi3pbcmSTw+6Z0Uy7njaMYLE6xaobN0c8yavPuGpOkqNPSPOgg8l9KUDUNpZxSp3lgugAF3QfigyEYwRVa5zIMWmq5R2/AyWvo9mniOp7ItDIKyUN4p2YvMagurIo3jIdo60opmFMODBNAzeuFneDHX79SXNPLSjYaRtebXtFAvJegXL2gi74SeDsTPfPMiUBxp5duEarQkZXZb9mDTll+e+sgQoGF5cOq1vU1FiG56ieqNQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(376002)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6512007)(6486002)(2616005)(53546011)(31686004)(6506007)(26005)(54906003)(316002)(66946007)(66556008)(66476007)(6916009)(86362001)(31696002)(4744005)(2906002)(41300700001)(5660300002)(7416002)(38100700002)(36756003)(8676002)(4326008)(8936002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmtJMDk5dnFMaHpPa3RvSVNici8yL1lITGc0RTJLTEs2V0JDcGpZamNvdDBB?=
 =?utf-8?B?MFNlL2hHQVNrVGt2K2F6M202aVdZYXJDZmJ6SFBWM0NNYVJkQk9ydHpGdUM5?=
 =?utf-8?B?QWtmcCs5UnhuVW41NndMWUVPVDNud0gzRE4waXNGazR6cUdqbXpvUkg1YjJD?=
 =?utf-8?B?TWxEYXE3RlFOaDRMUzV1dmZvcU1xUE9nelUxa2x4b25FQWxYRHQ5Zk94YWZi?=
 =?utf-8?B?ckpOYmEwNzhxUVBDZml0cjJvSUtKY0NuN2FuUW5lNERKeFJXK2lNY0FmdG9q?=
 =?utf-8?B?anFEK0U2VEY5SnFhKzlteVc2bU4rUnhyR2dxMzRjYmptTDVMdDdrWVRHWGZY?=
 =?utf-8?B?UjZQaWd6K3gvZ2lFQ2R3d2ltV2t6KzBkS2I0VW5NeVU5ZFh4RkRyak51KzB6?=
 =?utf-8?B?UExkQlVJR21Db2dxYzJqaG80eHpXWGlFdnhjUlM4WGlVeXlsWmFNWmJxNUtn?=
 =?utf-8?B?d0xTNTMyeHFpZnVKM2Zjd1lZN2hmemRzMnU1L0VCZkRIMi9oK29EZmJLaFdX?=
 =?utf-8?B?WmorK3JSNkhFVE5pN29wTmtpdEVvS3lhRkJQSDRpbmIxYkFBbDNtRkRObzdT?=
 =?utf-8?B?OHB2aVUzSzI5cnN1Ly91d2xjSWdJWEtNN0NjRkZGd1BiSVc3TVZaS1Q3czly?=
 =?utf-8?B?ZnU1SHNkN2RVTkdrem5SQUl3ZnRrT3BHMjdQaE9yZHlhQSt6L3d1cFZzTTNZ?=
 =?utf-8?B?eGNyZnNza1krMUE1UXFTZjlINGY0Y28wMjRBTE03UkVaeENEeVhOU3VxWFNF?=
 =?utf-8?B?TXNGNFJkM00zQXNlYzVhMzJZWnV2MVFPYzBrRmVRVEFlWmtTUHNxVkdvL3Zr?=
 =?utf-8?B?bHVHdWFEbEF3cWRzb3V6Q0QvNjVFT3d1Nms4eHkwclFWbkZIcU9xYTZJN3li?=
 =?utf-8?B?SW9TNmxFTnhTM2VYWmlkQlB1dGpwZ3VTdG1tSWcxMWhEaWxWdDMrNmE5dG4z?=
 =?utf-8?B?RTRqOGtkL0FZMnozamRCK05Xbmg4MzB4TGhtRWhjRHpTYWlrQ1I3clZBQlYr?=
 =?utf-8?B?Y1NBVHJaS3M3RHVsM1pyQmxsUVZ3ZzUzRU5kVkV5RDAvSnlXV0xWTVRpZU5P?=
 =?utf-8?B?RUI3TFhwclVyQTFIenozeU1XTWM0dW4vVjFyZTBzTlB1YW12UDBETkJJZndF?=
 =?utf-8?B?Y1ZJVnhwVlZDcmFKQ2FXcndNN1luQ2RGUHFBY2FkU3VyWW1adndaM0c2QzlP?=
 =?utf-8?B?eTZHdFV1Yzl4VXNHZFBCQ0s1WUgzdzZFM1RMWkRLSHdrYWRSeTRUTkN4dkNX?=
 =?utf-8?B?UHlveGlIREFIVFo3UGh3cGdkd1ZyZ2tRTHpESVZOOGRubGg3S2hxakQ1Wm52?=
 =?utf-8?B?N3IyVElmMms3T3FwT1JHNkdoM2tUNFkyb3hpWDJCdzg5aEtGYkIrRGNnZHl4?=
 =?utf-8?B?R3liWVlOb2RLczNIQ3ZZZnV1TmMzRVdKazA4N3VBZXRuMnR1RjdUbGtJNk5j?=
 =?utf-8?B?TzgzaXM1SU5WSFQzT1MzcERITnMrbFpjMUJUUFUvMTZRdGEzOU9zYlhnVEZU?=
 =?utf-8?B?aW01TW94c2lBWUE1bVdTQk1kQmprUWxpOGw5S2VCLzJVak9uVVBUamo0MVUz?=
 =?utf-8?B?dk9OaEcrUE9SMHBPMGFyOStVbi9IRStKaUNpQTJuUk1keGIyWE5wcmx5OU1Z?=
 =?utf-8?B?SHpmam1OZVYvWkhNckpwalM3eSt3SVBPNFR6alpaZHVEM3ZHWWFZR29WbHFP?=
 =?utf-8?B?eXdiT09HVnNtbkpZdE4zZ09IenFvSStGYytoT1Y3VFZYRDNjK3p1Wjl1OEJV?=
 =?utf-8?B?UFd6eG9tL3Z3TU96c1F4Y2wxTzZzWFZCNm5iS2ZnM0lUM3BrNXlhaXZxR2pB?=
 =?utf-8?B?ays3eDcwZWRsSmxpOHRPSDkvZ2V0UTRSR05lKzdlL2ZoemJBNGZmSHRTcUg0?=
 =?utf-8?B?YVFsUVFVVDRtanVIeGR4V2xzOXFZNnIzdHdobmlLZHFHaHc2cjA1MFR4dmkr?=
 =?utf-8?B?TWhHTytLckt0UmR5NnJqdW9Gc1VGSDBOeUFZWlJRYnE1Mzlsdm94YWpacktX?=
 =?utf-8?B?clYyY1JGMkNyKzAyeitCSkVCQTEvMDVtcGhVV2hSeEdkdUp5NDJRRytrdkl4?=
 =?utf-8?B?Tk1mbVNtUWpEbkZxem00cHU4UDY0U1RvSytmNWJJSUlEREErZ25sS0J1cVI2?=
 =?utf-8?Q?k9Z/eRgapdqLFY2GBNT8bJ5ZG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73aa0536-d31f-414c-59e1-08dbeaa8e90a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 15:45:38.9362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KYjylc4LBB0bSy691tghNEqmwpWWVu5bR5zULdS3Nkz8aZtX8mcpN7Kfzk8L9sKiW+PfuTB+0pwPd2vn6KqWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7509

On 17.11.2023 13:24, Oleksii Kurochko wrote:
> iocap.h is common for Arm, PPC and RISC-V architectures thereby
> it was moved to asm-generic.
> 
> Also Arm and PPC were switched to asm-generic version of iocap.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


