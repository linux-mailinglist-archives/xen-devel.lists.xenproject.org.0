Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3207802C4F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 08:47:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646537.1008874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3fO-0006D5-ET; Mon, 04 Dec 2023 07:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646537.1008874; Mon, 04 Dec 2023 07:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA3fO-0006Av-Bq; Mon, 04 Dec 2023 07:46:58 +0000
Received: by outflank-mailman (input) for mailman id 646537;
 Mon, 04 Dec 2023 07:46:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1rA3fM-0006Ap-6n
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 07:46:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4af2b430-9279-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 08:46:54 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7233.eurprd04.prod.outlook.com (2603:10a6:20b:1df::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 07:46:52 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 07:46:52 +0000
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
X-Inumbo-ID: 4af2b430-9279-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7zfeR3HMSQnctjH4c3nz/crLHK5w94fiRY9DQU0J0zZ/bwYOcUUpUxbddvMu26eCWN+Hf5Jar2SpUaCDDcQk7Vc6hnzVjX5mbN69XOUiO1tFZoXqLPxn7B31YcTrsL/xorqhsaOXNV/amLEEGNjAs4FM39jO4FFTah3CgOq+NDmxmJG/eYtBGIE7rEat3Bx50yTBEfy0CzvRkZRFY85n15KcjYByk+jjuqjZgtQr5Ab3y0UkZQZBfEd4yUbVba2BRO45gYAFzaCyhE/Bg3FHM8uYjpo8F70tgOV4XSwAtAhPJg94WvQlLnAxMBPctxnHqEtCoAe5leui/x2AOGkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NdLm1zNuPzec4QETEPw9e1j7zW5giHJkgFB4eaiKAg=;
 b=bDLpcROjZrfV8uLV+zV2KBkjXizGmm8/E63RumMUpMfLfLEbWnW+he/Qb3XRjuVWHRGiFFg47Vs4NJ/EBFBhHVibMskPVbzGvHWPDotLUA3ShSl2AiaGAMAOHGMcq8jOdak3nNnN0IXvVEBYMLlYipTAOxwuMoRzy1C9U+3sss/UXw7yKs5D8jqfrJesGcKwAJwfcRdI3QBiqWKuD4Ij9Y6ab7YnnmvppzEZm1OiAE1JM9HTu6OSp0MLfzi0T+IkipOyOmoRjfcRJyPsOUz3ojmlFAOCj8JVTRoKhyFpbFM7prItvFFlBik5ynRwFoC1enPaUxtrUPB4keYzUKVLgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NdLm1zNuPzec4QETEPw9e1j7zW5giHJkgFB4eaiKAg=;
 b=HedbB3HyBKVhYCLvLHn5Qez4yPT4v4Oiq5NcWe27B3dS0TaFRHjg5D3h78HypvB2sb5yojNQwioirUoMxaoQuBpk2LfX53HyzmehbMPMD+UKH4CbV2U21TCzB7Vda501aIVJMVKyPSXfzfwzee9N98WGSd/B21ZIMsi5Q57o+ZklhooVbcj1CB1wtQBOMa8V76wLgukY47FtHHrIaOewOkJni2waCaQiTLKKHumwqRF81hH3Uy7AToQIJK1dEZGMiOhYJHRaYtTttTT7GT/8yopPkx1DAmxvAR98HI4iO44kMZE2SaI9uriOTfz142PSsQIYeEWtohELkdjmC1Uehg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dafe662d-cb6b-4ab7-b55c-fcc21cb1a586@suse.com>
Date: Mon, 4 Dec 2023 08:46:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] xen: address violations of MISRA C:2012 Rule
 13.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1700844359.git.simone.ballarin@bugseng.com>
 <771a6f804f4e7dda3897359b57d1d14c2878ea16.1700844359.git.simone.ballarin@bugseng.com>
 <2d4d3dab-f5a2-4b57-904e-e48642f7937f@suse.com>
 <alpine.DEB.2.22.394.2312011921250.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312011921250.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 94436e33-9b7f-41d3-4776-08dbf49d2dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NNMY1sCLpAZ/umS0ayygMc/xCwxXXR9iEqNgpXIFgW3MZ5n2jXqKNRsWr2lXM2b2IOUL1obU1uReMr5z0+tAq1RU1mgkSuoUyB4pKbpL6YHrFDTV0s/wiZk+M3BRGliVeovaYVlhIW4mUJ6Gg+E4jNy3C54lgMGGUEg7XKEnlnpJJhR0WRP1xMvtURjcMn10mk/CTaEE86kBf2C3kUMvdxYEULTbtbCyuF3EzPNYIqh1Kpo/SeNXhOXTIG0SO6uPgMXhdT8sLA4WakdlDj9J0VTJcLajdZq+9pcc/0VlyrbpJ2lwSJZQYpQAsqHTvBmXWoCr8S9QXBsYRjWLg07Ulm0ca5UnBKdJ0+4QQrZfqZdX5UnzX1FuHzxfZuymXDc0D6r6ZGxbNR3utDfJej62KiK640zWJ+A+vWJyt+Tv7oIKAHRIEmXqjJFtKyVrbgM1Vszv1e96cOntyWtKQBSO5DN+ZoDKDxdzWnlSZA0hGej4pbq9VFU46j+5LdtY7lFuaXvuLLrqijTPb93mZTlfvbAB85YQopMz221nHYO0cewGRV5impmImQjoiYmGGBvVlXbyjY4hZ09rRQtr1MgeFOifv5R5v4Nl5x/v0Bz0GLJsvpi8YEZkpqysOOAm/nq/JYy2i6VMbWxXpOpdY8fKqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(54906003)(6916009)(66556008)(66476007)(66946007)(4326008)(8676002)(8936002)(316002)(6486002)(478600001)(66899024)(5660300002)(36756003)(41300700001)(2906002)(31696002)(86362001)(83380400001)(2616005)(26005)(38100700002)(31686004)(6506007)(6512007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnFlS25qS2dlbWdkTWNVeGc5UktFdDN1bEN5TkZZK0k2SjVXYXJMcWp5V25I?=
 =?utf-8?B?bHc0LzdmQTF4YWZJQXh0bTV5ZkNWb05CQVo5NXFXc2RoT00rVWNxSXBuamZB?=
 =?utf-8?B?Q0Nyc1VjbmxGL2hkWEpRbGlQaUN3N1plSU0vQTM3VnNWT1FOcHpZYnJXT3lz?=
 =?utf-8?B?SzlDZElNa3Jjei96T0FVcEZuV3ZuZmR4WVBYOW9nV0dyU1A2NkFNQmtkdHNx?=
 =?utf-8?B?WEVXK05GVnZ2eFFxUDh3aWxvTmJFc1IwSmx2bXhacGlXNWlJeUdXMUxsZWVi?=
 =?utf-8?B?UE9tN0YzMkwzb0dmaWZJN0dacUtYNWJPdXdFRHhla2FqWDMzbUJRdFdNbVRq?=
 =?utf-8?B?b0RETVZYcGRoR0pSTEdmaGVXZEFjTC85WFhpbzduM05zTXdkZHhIKy9pQzVG?=
 =?utf-8?B?RFQ4R2g3bzJ2U1VVMFBhYVEyYXEvUG5OV2t5ektOVGsxcWhwTXEwK3lYSW04?=
 =?utf-8?B?cTM3c05oWmxsNWliY2VRV1BPVnF2SHdGVnhHWEtjWlZ1L2M0NFNORXhaWXRZ?=
 =?utf-8?B?SFh6dXhic25GUzE2RS9xWi95TFY3VUxKdmtYL1VFTzM3anRpTFlVSTY2cFZE?=
 =?utf-8?B?RmR2b25MYjNpbkQ1WlVRMWtObFZYYU83ckxjKzFyTXFDN3hrNUpXQ1N4NzlX?=
 =?utf-8?B?VU1xWjJOVFRWSnVFVUlQczA5YzEwRklsRUUzS3BGNmFrL3N3SG1CNjZmTmNY?=
 =?utf-8?B?a0JYOTJVMDRSaHYvaUJ3SmZBbzVQL21qeU0wL2Vya0xXVUdjTE1yeDh3azdX?=
 =?utf-8?B?SnFMeGdCZjZzcWZCTVA3TEszNEFRdGtoWTRPbXFXUUg0ZUY0K3hpYklQajJ2?=
 =?utf-8?B?cWNyajFLMERiaW95SmZ0bnNoS0Q5OGpGenRURmJQVVNjWkpwMzVFbmVwY0xu?=
 =?utf-8?B?VFJLQzVRSSt0M3JKVXZqVm0xMXYzRXVpa0VLQTU5TWNXeXljajhLVmpwMWN1?=
 =?utf-8?B?ZGRPaTJJMUhmcjgzalZHWG1SWlpkY1NFZFdKWFZzdXVZQWVPaGN1NklsWUR4?=
 =?utf-8?B?SU01SEhIOU55ekloUy84NElYWXY1akNZalgzczVuZmFWY2o2VDZVZUZNM1pN?=
 =?utf-8?B?d2x4RVpOdzAvV1cvWFpvT2lwamlrL0xLS21rUENMM01RclY4dTFXeW82S3FQ?=
 =?utf-8?B?VlVNeUZwbmc1WWo1OFduZjdFazdGWUNQSGZ1dzBjN08rOWo0NngwaHNoVzZ0?=
 =?utf-8?B?QjFIRkRwcjFmQWl6Y3M2VStaTUZOWlp6bi9aUzQ0Vnc5aWNyK2NOaG9Delh6?=
 =?utf-8?B?dEc4YnE2eHpBSkEzT1ZmVDk5TGxZamFUbmNoemZtejdCYXZtRERPZ2JPbFo5?=
 =?utf-8?B?bmZ1SlAweFJsaEFLbGhHTHg0MEpNNXNmVFM5cGU4RVpxRko5Q3Q1TFYzeVFr?=
 =?utf-8?B?R21PdGZkYjFZTGN2a0U3a3c2dkxrRU5ZaTNBTWNuSmRmUWNvOHV3TjZRMFRs?=
 =?utf-8?B?SU56VWJOMGltTHJuZU05S2ErMlBKaFNpK2wvdllmcTlCNmMzWGVERStSZDJl?=
 =?utf-8?B?QmFVSWhUbXdRaWhobkVrMGdJLzd0ZXZsejB3NXRJcDJMa3FWbElyVjdmQ05F?=
 =?utf-8?B?RzdTUkZHM0s3RnpBNWl4d21DTlQzVmt3K04xc2N4aXJmOWp0cXhOZ3QvaFVk?=
 =?utf-8?B?dkwxRUNKVG9HK1JMclpKVjRtQUtqZDJMdGxTQ1NrY1kwN3lIMWhQZGRVemNQ?=
 =?utf-8?B?T1VUS1hHWU4wVm5oem9PM2k1cFE0UUlSQmlOd2hVejNNQU5CaFRhbnh6K2t2?=
 =?utf-8?B?OS8ySXNFNXFBbjJRSDhrVm02VXpXbnNBSmtRYk0rT3c0c0p2UExmMjY4UGNk?=
 =?utf-8?B?ME5uRVNJcmp3Ui9xbzJKeVlhenhxS2RLeEFQRUM1QjE3ekVpUWliYlNUK1Q0?=
 =?utf-8?B?a0NTcjNIcVpkc09JTDNyOEsrRmpuYUVaVUJEUWg3OFpia1pIREI5N3ZVK2pM?=
 =?utf-8?B?ejJIcGJvWW9MU2IreDRBMks4WW5tVzRrTVVDZ0ZVWldQVlpScVlpQmI5OExi?=
 =?utf-8?B?SEFDcXhza0p5SU90YjZrZEMrUHJQOERBM0twSGttaVhIZ2NzbnZIZ1BnTldi?=
 =?utf-8?B?ajhtbmxwQkNIUExrRXRKNzUwOXpTQ0dGNjBkU3N2TVFUdlJrTFNEbGpldGFX?=
 =?utf-8?Q?BEBFMTGGzNd3zBXogGzUAFBCW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94436e33-9b7f-41d3-4776-08dbf49d2dea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 07:46:52.4260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFP0LCS1+2tWUlhH6+XJvtqB/wcxVI/jokinJeTWvt+ZsY5qEqicjaJ6tPys78olH7U+gS2bt/fV9Qzz47Cutw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7233

On 02.12.2023 04:22, Stefano Stabellini wrote:
> On Mon, 27 Nov 2023, Jan Beulich wrote:
>> On 24.11.2023 18:29, Simone Ballarin wrote:
>>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>>
>>> The assignment operation in:
>>>
>>> .irq = rc = uart->irq,
>>>
>>> is a persistent side effect in a struct initializer list.
>>>
>>> This patch avoids rc assignment and directly uses uart->irq
>>> in the following if statement.
>>>
>>> No functional changes.
>>>
>>> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>
>> Who's the author of this patch? (Either the order of the SoB is wrong, or
>> there's a From: tag missing.)
>>
>>> ---
>>> Changes in v2:
>>> - avoid assignment of rc;
>>> - drop changes in vcpu_yield(void).
>>> ---
>>>  xen/drivers/char/ns16550.c | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> This warrants a more specific subject prefix. Also there's only a single
>> violation being dealt with here.
>>
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -445,11 +445,13 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
>>>              struct msi_info msi = {
>>>                  .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>>                                   uart->ps_bdf[2]),
>>> -                .irq = rc = uart->irq,
>>> +                .irq = uart->irq,
>>>                  .entry_nr = 1
>>>              };
>>>  
>>> -            if ( rc > 0 )
>>> +            rc = 0;
>>> +
>>> +            if ( uart->irq > 0 )
>>>              {
>>>                  struct msi_desc *msi_desc = NULL;
>>
>> The fact that there's no functional change here isn't really obvious.
>> Imo you want to prove that to a reasonable degree in the description.
>  
> Agreed. Only reading this chunk, wouldn't it be better to do:
> 
>     };
> 
>     rc = uart->irq;
> 
>     if ( rc > 0 )
> 
> at least it would be obvious?

Indeed.

Jan

