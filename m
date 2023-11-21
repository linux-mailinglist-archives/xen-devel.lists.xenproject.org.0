Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93D7F2667
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 08:33:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637537.993420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5LFw-0004zp-N4; Tue, 21 Nov 2023 07:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637537.993420; Tue, 21 Nov 2023 07:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5LFw-0004xP-Jl; Tue, 21 Nov 2023 07:33:12 +0000
Received: by outflank-mailman (input) for mailman id 637537;
 Tue, 21 Nov 2023 07:33:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GR51=HC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5LFv-0004xJ-9e
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 07:33:11 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3887a36b-8840-11ee-98e0-6d05b1d4d9a1;
 Tue, 21 Nov 2023 08:33:10 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS5PR04MB9969.eurprd04.prod.outlook.com (2603:10a6:20b:67c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Tue, 21 Nov
 2023 07:33:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 07:33:06 +0000
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
X-Inumbo-ID: 3887a36b-8840-11ee-98e0-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUFfQDfsNQDP/QLNHDvlm2qsxHAx+quo9DbTOA04pCL4skWlVy0Lr0DlWrg7NZ7B+A8MF2xB2oSDRzMuxGk8JguBdok2Zd0DQfbiZsIgnLjw1yKi3q7TmFZswPXrGWNcnD3/402m1u6y/G752112Yy3C4peFPecXGYALukZOydL0kUFq9PU1yQSJUUhLN3/1CYhuVy4H9C0XZLNrFzJD2a0dsf8mlnVjcasLGm7J1owRIAnvFVDNNBy+r6dFZs5fTbE8RZ/CJJEyNJig+duZA38tZ5dnCKNswidrAxVV8xb7x31uDP33nah3Ky01iLhlsg/vtGtAOEArfIPUr4f5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbc0NTo8XWnPFreyw6Jpx7UNGoBpKx7nYdeSqYdiVS8=;
 b=eqvNt7NO/6O8UZqhb0VbNx9SMEZ/bgs4LqziM1YeuscieoTKof1TFwXEhO5ebLV3HH3kYZv8opKyqcdNp6UVsfy+zZ5X4qhjAkhD+VbgWiV//Wfjcms5UsyY0nHJG0pXDhH3kpBJGi1YqzNpq+wH3Dd+UXO1+t8HDOHV1+ctjFRzOz4SScfwLqYs3aM84lcq463AWNnbw3yoWiI9zZjr6IxdZzAdehU0BHF9UxmsO+D6QJ0/4C3F2gp/MQI7jWySAhU+qrgvCkWmK9W7pwbr/QRdWfP4IsgHkLd/YPGb99SB5DJ8ZABkc4jNcYMP05erJGeqXfgcwU7W/tYiMIz9ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbc0NTo8XWnPFreyw6Jpx7UNGoBpKx7nYdeSqYdiVS8=;
 b=fdwT3ZTR1mJ9uQajsKMs7RUBjsmRKPu8IwnjNx/D5Q2jx0fL7lonFvyVMn3Pn1NQN86XaW+yCYRXcCnedG3QE13Wn1UFG297evH+9UF5FcbW7nmN6FmIJcVLvi71/3NHHde7IStuPD+VJMBL9GZzkP8csaf+Ie3ujLx12LZaa0Rd5uqtdq9tXtE96M1ThWjaq2fmwlsdD5iqOUQLK7WbeqQykmFMpV1bP/1O7G/nY3/xGJx3DCkf9B1vR6ORUx5UAHsSZ+hoBkVBX4pRmvrOayYU5g7W8KSr4uTvHwtaEzpmpAS1pa81tUU5S+CfTqSkG7tIj8GNaHAX4EZdpiPmbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc07af2c-c011-4c06-a573-6aa95deb9ec6@suse.com>
Date: Tue, 21 Nov 2023 08:33:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/5] xen/sort: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1700209834.git.federico.serafini@bugseng.com>
 <de68f8220fbb97ae6a3382138c23e81d0988a472.1700209834.git.federico.serafini@bugseng.com>
 <19d887e6-8c07-43f3-a2de-88ce0a0c99ba@suse.com>
 <b481a966-4f29-4b05-8246-d3f1eec19d0c@bugseng.com>
 <51010cec-596a-4249-82dc-ac711c3962c3@suse.com>
 <alpine.DEB.2.22.394.2311201603220.773207@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2311201603220.773207@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS5PR04MB9969:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6e4aed-6ab6-4cc2-f779-08dbea641a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h7OF/GjyaxEnfkKgJSmTJ0y7yzsY1RU98aWGDjKz4qJUZb7mgz5g++ynWt2AO0BLD/vMfJg58tK8XkgcOlxz4LOswbZyIAkwxWo9CmecTizjivU0XOWIpBcTB3zBkDFffX4EnivEb0/blcJl31e/xXlgMgKGsYCVNDwMgdzXFb1HrxGy/QGLticf40xJjeT5RKoxXHtffJ6W0F7NC+RsqRTijEqCfqMqSGNPoO/A44jVT9b9O/DxoWJmfM6FfCkoMIvifkK6uU9fP+EZGR+3eHx7XHwAMVfa1NVcLEoynyPJ9OtDsczkWT+70bBc7TqTsswfNLU+wptEBEe+vnTKPiEpUWR88b6VWZnciS9jmB7Ri0mfO3IRM2YzETVphMc0EzPyrPFHr88V6niOJCBW3aCaPSQ5+3ITz42hWS3XAe6q+TFgEdjoQ43e6ImsSdko7VvHqZq/aFHoFJfhoQ4n+83kSRz97rIbr4Aiq0exp7kcSULjy9TuDvRC0vozD7cv06IELexyye8jkAd/sY9zH2NPtEEbfaUbAiMvQkrl4ttZKLFbmsVMsin2IbhBVaiEu2UbMZUif2nKe2+bpU/X5mr9GWC3QyE3u8e7RyFcIgwkQBK5IOgSIa2Nt70x6iAf259EczYvxbrq7DQXd74nhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(6486002)(83380400001)(6506007)(6512007)(478600001)(31686004)(2616005)(26005)(53546011)(38100700002)(54906003)(66946007)(6916009)(316002)(66476007)(66556008)(31696002)(86362001)(5660300002)(2906002)(41300700001)(8676002)(8936002)(4326008)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0pRQ044SzRZQ08xVWhHSjhOckRwMnk2OERJaEQ2RXF5VzhVejFzMkR3c0E4?=
 =?utf-8?B?b3VBMGV5V05FMWhiN20wRmlWSnNBeDdJdFo1V28zd1pvd2pPZ3BOMzlLMFBZ?=
 =?utf-8?B?dkU5a2JGZnl5aXZDdnZzYnhROVZIU2tXd2t6dFcwcTBNVlFyd0VRMFdiTzVk?=
 =?utf-8?B?ZXArQm5yQkdXeGhYM3pNa01DdTNwS2VZMWtRcFhBVTI1ZDFLZGFsbXF6WDll?=
 =?utf-8?B?Y0QrZUxCOWdoQmFJUUJacTAzdEozU0tzdDBueU85SnQwTTVnNTVPUVNnVkd5?=
 =?utf-8?B?OWxJaHhhYWFLdHJGMFB3em9xcXorTjVMVUdSYnJSejJ6czBmaitKZVkwdHBE?=
 =?utf-8?B?U1lHNkpzOE9ycXBnNDdQbCs0d01mU3RsT0psS3RGaFVMckUxSk8wWWRrNllr?=
 =?utf-8?B?bXFTSUJBUTFiZkNIeHVBRkdoczVxN1RQRFhLeWRVWWdyamp6NUpSb0ttNVRP?=
 =?utf-8?B?ZXFMSzZhenFROFlnL25PeElNYzR0ZUdYMWRCSWgyYzFyQ3A0ZXoreVRtL25L?=
 =?utf-8?B?K0JRQ000d0VLZ1N5SjV1MVVWV3FwRDNiZkNxaEoxeUpjRDhBeCtPaVFyTmNl?=
 =?utf-8?B?VUxOQ3E5OXpZc21PZDFIWnVTOGovb0F0ZW92RTVXQjMyaUd0OWlvWlE3TmxE?=
 =?utf-8?B?R1k0SkFmZW9wejNqbnM5YkxWd1ZwLzlIeVNQR28xV0ltN2cwUFhrQzcrVjBl?=
 =?utf-8?B?aDdWVmpRNTFSQVAyNWE5VkNxcjhzQ0w4RTN1b3RTMkhrRlAzc052Uko3cVda?=
 =?utf-8?B?T1VjYkYzTjY1VEtYV01NOUJINUxmczZjdU4ralVKUVh0dnQ4MXRqbnM0YmxX?=
 =?utf-8?B?MlJhdUtwNkFTSXFIeUdpNy90VlJ4SWpSdXZsQkU4S014bkFsLzI0Y3YyVlN3?=
 =?utf-8?B?WjlTUUVkWWdvOTdiRXZIc3U4VXErWlZJVmNXY21UUVpUY0p4WmloMlVOQkVW?=
 =?utf-8?B?bkNra0ZxZVowUmNzMnpIRWVhS3h2WENndSttTVJqVzJ2QzczemhoWmc4OExJ?=
 =?utf-8?B?eHN2QkwrR0pDZWNkYlRMMFVCVUFSUnIydURwVm1Sci9sMkMyU1JPN0F5WS9Y?=
 =?utf-8?B?WWRIZ29mZXVjNDM0Y0RLRC9vVis1cUdFVG11OFgwT2ErZE5lUW5nK2xlODRW?=
 =?utf-8?B?US81R1k3SGNKNzM5dWF3MUorMEdKclBDVlFVeXdqd1A2YjJNZTNZdk1EQUM4?=
 =?utf-8?B?TkxUdHpKNEQzWlpqSEpBMjhsY0ZGWXd2aDdSbUE2RmZYOVZEMTJXV0tqMDlm?=
 =?utf-8?B?eWZ3enc3UXdscXNXa0F0T3g1aGlrSmsyUVRDV2VFdUY5LytpYW9kdUg4bDYy?=
 =?utf-8?B?VG5iZTJoVVlLRjNqY282VkpqOXhFWk5GUmdFeFZsSWpKNnVhN0xhb1ltd2Zl?=
 =?utf-8?B?S283Tk0xMGhVbWVzcmQ5T2tXTWFtZkh2NFFWR3A5ck5iR2ZFOWhWcFFVWWNh?=
 =?utf-8?B?V3l0MHg2WDNHdDZxQTI5RllxN0Fudzk5RHc5OUxFbmRzdDBBTlZEYmFmblp6?=
 =?utf-8?B?RGJDT2dicFZzRU1sTE9WeWJLVThUZE9ZNTg3N0xPVVlrMENlQkYxZmJ4Zmp1?=
 =?utf-8?B?a1lOQWlPa2hvNDZKRyttSWhUdjg5N0RKQ08rRDZ4ME94YW9RZHpSVHV3OGZE?=
 =?utf-8?B?bGZ1Ny9xdHFMUEtZVkhCZEgwdmZvY2lvZERBa3BaNjZDelpaMGFwUzNwQ2hP?=
 =?utf-8?B?OVEyYk5mNDNhaGExeGYxMXNHYjBmYTNIeXJYeXg4SDFuM0RiOVVyZHBmMVhJ?=
 =?utf-8?B?blB2WTNiTWhJL1ZVaHhORHpET0RQbzJsZ1B6WnBlSWVSMVNlYjN4dUtKcGJD?=
 =?utf-8?B?MkVJa3gydnVDV2p6YjdWdW5RdFkrVU9sMzRjMXhaQlp5blB2d0JjSDZhOUVS?=
 =?utf-8?B?YXZRaEdjTWdVb2dmOXRPbHViWERCMU5QVXR6NzFxUHhuMzBGelFBNzN5Tzhi?=
 =?utf-8?B?c0liUUhDeEVPS2NzT2c4STJNVjRFWGdhVnRMZ0k5YWQzY0owT1pVdElhRjBZ?=
 =?utf-8?B?K21YV1RXc2dPWFJ3S3MyZit1bFlRbUJSeVpLUEFsalZrZ0hULzdxVnF2UkVn?=
 =?utf-8?B?dW5RblBjb282alZmTTBSblNvOGFBUUpwZ3NNbU04bHNVckFHMHpjdmx4MnBR?=
 =?utf-8?Q?7EIizG3TD+65/pRh2irN/9EbX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6e4aed-6ab6-4cc2-f779-08dbea641a32
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 07:33:06.2721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6wVSbvbPpW0R+IWUsp5BRjjLLqx1i6pERAFEVF96FqgBdyiyjUltT01BdNgxs9FhHqA2PQGFaguN9wNGdAQpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9969

On 21.11.2023 01:04, Stefano Stabellini wrote:
> On Mon, 20 Nov 2023, Jan Beulich wrote:
>> On 20.11.2023 14:13, Federico Serafini wrote:
>>> On 20/11/23 10:02, Jan Beulich wrote:
>>>> On 17.11.2023 09:40, Federico Serafini wrote:
>>>>> --- a/xen/include/xen/sort.h
>>>>> +++ b/xen/include/xen/sort.h
>>>>> @@ -23,8 +23,8 @@
>>>>>   extern gnu_inline
>>>>>   #endif
>>>>>   void sort(void *base, size_t num, size_t size,
>>>>> -          int (*cmp)(const void *, const void *),
>>>>> -          void (*swap)(void *, void *, size_t))
>>>>> +          int (*cmp)(const void *key, const void *elem),
>>>>
>>>> Why "key" and "elem" here, but ...
>>>>
>>>>> +          void (*swap)(void *a, void *b, size_t size))
>>>>
>>>> ... "a" and "b" here? The first example of users of sort() that I'm
>>>> looking at right now (x86/extable.c) is consistent in its naming.
>>>>
>>>
>>> On the Arm side there are {cmp,swap}_memory_node() and
>>> {cmp,swap}_mmio_handler(): "key"/"elem" are used for the comparison
>>> and "_a"/"_b" for the swap.
>>
>> So - re-raising a question Stefano did raise - is Misra concerned about
>> such discrepancies? If yes, _all_ instances need harmonizing. If not, I
>> see no reason to go with misleading names here.
> 
> Federico confirmed that the answer is "no".
> 
> I think we can use "key" and "elem" in this patch as they are more
> informative than "a" and "b"

Except that "key" and "elem" are (imo) inapplicable to sort() callbacks
(and inconsistent with the naming in the 2nd callback here); they _may_
be applicable in bsearch() ones. Note also how in the C99 spec these
parameters of callback functions don't have names either.

Jan

