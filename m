Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C96F564F
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 12:37:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529092.823099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9rL-0001Fb-2U; Wed, 03 May 2023 10:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529092.823099; Wed, 03 May 2023 10:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu9rK-0001Dx-Vv; Wed, 03 May 2023 10:37:18 +0000
Received: by outflank-mailman (input) for mailman id 529092;
 Wed, 03 May 2023 10:37:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu9rJ-0000lp-Cu
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 10:37:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7927021c-e99e-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 12:37:16 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VE1PR04MB7263.eurprd04.prod.outlook.com (2603:10a6:800:1af::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 10:37:15 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 10:37:15 +0000
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
X-Inumbo-ID: 7927021c-e99e-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idqv5qDC/nh9+ZeiUrkDV/6iHDBR6RPMZzuH+pFEz/2GqMoF2JjXAjyld6VtXNWENIs/q5Tzaqj/G9J6gpq6hj1ujLYWHuNWD43ZmZHzqBBdu3JAj9po/RSJAU6wPlGso6MCxqGFyHL2GkWwffp6sFWyoCGv02In+aMMa0RZ5RlNLBTXW3abXQdRICf+GNMv03eCRwCM29DSapqstk4E383u5+KibZWZzsFVygrU6lbPBYB1tTE7XVWcWFLUUHIr3TkCuy2ExIdFV5miNa865CZVOe1b18wDgxieyolMnapZOZLFLNTjZ5cITDmvqiBL15b+T5aXgJvzkH+xXnKqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHBPuULj0Sa/v+7ugwG02mbs8ZvG329LJjK9HhyCgLY=;
 b=i+Bz2/o/7zyAbvnZ1KeNETh1WQ5GynvW8NwZg+uoV8h6Sl09ydRpMEyEqyTAdhuS3UYKrUh6iIVcYSuTh80lxubHR8M5eiaNwM7iMObNFXufZv5Fu9f6XlAvWByCorDyL2nl/qA+6LTXzBarljSbJDeUDMjdCyBEJVoWerfUEfe1dqHLTCdev1IRj3U8XkdfWFqqdQcE9gJWqdvmfWi2HsmpxtTK/mzy+nMSCc+Brdngw1xkDloxSx1lm3K6S3YipGobCr7twTG1VpvzF+YEM8B3NDyZMmu544sVr+GTDdLH706/1HHf9HtR8MGEZhx50Kf7H4KCbVFDN7NbWbKYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHBPuULj0Sa/v+7ugwG02mbs8ZvG329LJjK9HhyCgLY=;
 b=Ut0w9EP1qB83gfS95dE40C5K83uHoTo35rejFPXI3sPuwOOaiDuAQfhtPkLMGFySPXhsbo5oKhjH1O119CysKeldtDvQ0qAdibcWf0CDKhBkSW6xsUPKO1KqOv0TV/dpW8lZ1kIbShTL6xcoJBELdqwoD5xnmayfoU1SqUyTaslwJPWPEt15WuIWHTGBTZHu7KIhxTVLZbwJcWxBbY7RWYn4Yx+sDd6izZHwOiDRG0DYLgygXP+SUakk8vzsVRhjJ27XWyBA/4uyWXHnSxGp3hrpMfpkRYSorySv+L0a2G74SDrswBWII5BAZBkMFtu7swBwlWBami5Vph5n9CjOZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <594ca301-8f4d-83ff-3de2-a68741767bb2@suse.com>
Date: Wed, 3 May 2023 12:37:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Ping: [PATCH v2 0/2] build: out-of-tree building adjustments
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2e3c8f9d-8007-638a-c88b-21ad2783d8d3@suse.com>
In-Reply-To: <2e3c8f9d-8007-638a-c88b-21ad2783d8d3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::6) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VE1PR04MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 2425850b-2cfd-4ae7-56f6-08db4bc25be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h0OUC79i62Nq6BVvA0enfoIXZ9pEVFDvjWjAmtu57Alt8YVrxHRRdQkp2e3jmMJYTtHYoI59xENtnK0AxuIOOkG1PiB0YYpn99E6b3V7i/h6Z8w03W5EFCbSNPnDh0xEVImsc/zl+FEexsGdi2vrcXy9w1oovEME3m2RSvwNL7D+S8vS02Eo9Wn2BBGfj9df/N4AmYNpTZ1S9T0WCa8EtUJqLa+PD+YK9074yly2zYVjSlss37YhM2Wnv06AvhFFiTIdgP6ZDH+rqx6l+qb+CdCuS33Zvi1iijcOv07cgf+VE7IHOU3eIKIxvrD40zyIY1CDmcXdRfNsbBh80gE9IHEerrJH7X5VDoj0BazjSaNEQqr3Odo7nWYyGRQLMKBN2EjuWPu8opIxHkAafYdYwp+tvn/C16YdIFNzmgDjclLOEwlALMdoIcL7Ar3wBze91IMfH6V5KqPQWa3unqICWfkyFw/yC+WEk7xBnhVZt2uBxzcDyZ4r0h1z+yRCXyIDabZTjdSxW9G3F9aa2T0nRpwP6Psq4BVCLvwKzH0F16+9mzYayBSehaWaNI/8VuIqGCqPWJC0tUmqWuPkhz1fCRvR9I32OWrNvflrg3f92VrcxTAa28IhfgQi3aUpS9aEgEdZ+ZL5puFDpn0KI23aNkDgA14A1Y+v2xv9VShHYAu/eE7iJui6+QIhrto0PWMOFSVk5VoK8fYmAHVmpK4X4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(396003)(136003)(39850400004)(451199021)(186003)(31686004)(4744005)(2906002)(38100700002)(2616005)(54906003)(53546011)(6506007)(26005)(6512007)(66476007)(66556008)(66946007)(478600001)(5660300002)(8936002)(8676002)(41300700001)(36756003)(6666004)(86362001)(6486002)(31696002)(316002)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEJpNTZRQVpoYTk1ZWZJbFl5WWIzK2pTOVRublRqYXhvZ3J5NkFBWXljYVIr?=
 =?utf-8?B?OWNYT2drQVQzMUZ4WTBGQ2hLYU5QdzdBYnBXaVI4NWRZMXRKZ29ZL3NDbm01?=
 =?utf-8?B?Rlc5MmZVWDZzVEZuQnE5dEpDYmxoL0FzL2tYSUs1REpzYWdTUS9LSTlPdzYr?=
 =?utf-8?B?R1V1cGN4bUdlS1dIcGV3OUJkeW1rSTdocjIvOWZjaC9xU2lLNncwcW8zS3pi?=
 =?utf-8?B?TUk1eE9QYXBxUER2bGhkUEpYSkhoSE85SThoWVp4SE1IUFFGbk5WOFhla3BB?=
 =?utf-8?B?MnFxUG5rZkZuTWV6SUZwemRPSnMyVTl4QXNxMUZiZXBQbmxQTS90cDFyNW11?=
 =?utf-8?B?KzJhQStXR25ya0g2Ykx2MEltLzljOFBYQW1HV3lTV3p3NTVaV2VZc3lzYzBu?=
 =?utf-8?B?RjhZNXhaZnNlR3NHMVN6VFlQQmg3eWMwTEZCWlJkNXF6Q2lmWGVxL1ZxNmg0?=
 =?utf-8?B?d01MTEhXUWwvc3IvaGdIWXpuMDVpOVZKQVVKVzB3ZWxONFF3eEUwaG9rcEFl?=
 =?utf-8?B?NHVpMW80YStHcmxiR3EzUXFhZUpjRENRdDd4WUxhdHJMVXJPUVdiQlZiM2d5?=
 =?utf-8?B?L1l5Nldad29lYWJYL3V1R3BvcXkzMlI3cFp3eEtqczJZanpIMTJJZmF0RWYv?=
 =?utf-8?B?NWx1bjFlNXFxd1E1cTNsakRnUWtkYUF0dm1wUWlsSUtYeXI2WkRqTDZLV1p6?=
 =?utf-8?B?MEhSUktQUVJIZFVkZDBDU3lwQWIrZXhScEFOejRIS1dCYVJpUHBZL0VKTkx5?=
 =?utf-8?B?MEloMVZYZjdBd3VQRTFQOU1uY2dOOVZSZVNKYzd1dDdvVGVsYmd0VlpLZkRG?=
 =?utf-8?B?US90QTBjTmk5YzJESnVFMjRaeXhoQVNZQ0VzM3doZlB5SFFtb3c1cUlKMGpY?=
 =?utf-8?B?MVc4VUdWMmthYWU1TU9hcGFOOHkrV2dMK1FzZUV0N0s5YnFidTgxRXNiUmp0?=
 =?utf-8?B?aExoUmV3MVA0b3JLZ3dhS3B6TXc1U2JQY3A5aEdqVVZCOW1aY0c5QVlKRThQ?=
 =?utf-8?B?bXRQUWFkUTlURTlEbC9rQjZTRFRHZlI5K1Q0TnErUTRZNUFTb3gzelA0OUVR?=
 =?utf-8?B?RTk1YXlCQUtodGNzVDMwZTNkQzZ2OFpmOHNiSGRMU21sdVdvdXp1dy9RaUtk?=
 =?utf-8?B?TzFLTEh2U25SRmxDd2MydUZOODVQRktQQTZXWkxrd2R5TVV4dk81RGtjVXRE?=
 =?utf-8?B?WHdpZlhnVzZGTlFDWVRVSWp0SXdBeDJadm5kbDRjVHBheWxjNWw1SjRudTFU?=
 =?utf-8?B?dWV3U0c2MHNYL1l4KzR5VU5xSlFqVkwrckJsSDVIK1FBcEVYSlVVYm9uVk9u?=
 =?utf-8?B?Ly9uS044Zkt2Zkw0eXZ4Rm8ybHNZZ3hQVW1XeVB3d3hLS2F1YzJDd2lXMWI1?=
 =?utf-8?B?SlN3WVR4ZUxlcHhPc0tHN0RuclVBSjJ2V2kyTkNNQnRHNExrekpSdWtQZ3pZ?=
 =?utf-8?B?SGozMkYvdHRMcVVad0VWUEhTUVBmYThmcERrbXcxeU9CcHNKdDd4VEtNaG5t?=
 =?utf-8?B?cjY0RDVwSUN6Ykx2dXJpMHcwbU4rWTJwOE1GT0FMbWRwLzZRVmNodHdVZVlX?=
 =?utf-8?B?MmE1ZWZmRk45MGhMZFFyZkdZU0c3MGVXd1kraDd6Skl0b2tPS0NhcTZXZWNV?=
 =?utf-8?B?cDZZcmhwWU50YTl4N2hVUDBwbTUwa25PaTNUdFJqTUFrUVJiemQyTGJxc2dk?=
 =?utf-8?B?U1NUR3orWTNRUUNiZ2xscE5MbWlybkFyb2U0U3V2ekhqMDBrbHg1U1V2L2xz?=
 =?utf-8?B?TEFIdkFuTnEvcy9Kd2V1Y2hQUGRBR2F6Y0tUQXZkc01mSDArRnZyenRRZlhU?=
 =?utf-8?B?QjRkb0E0RHQwWFFnaWovYVJ5SEVIQytTeHZwTGNEejI4eFp0Nmh0a0g5L0hu?=
 =?utf-8?B?MnN3M0VkL3FjdjdaRTVDbllUcEN1eEhNdVNOVG9xMTlvNnpPWHk3YnlZSWhM?=
 =?utf-8?B?VlV4SXpsOVNxU2pEWEk4SjFXM3JEeHd6WDB2R1drL1hCSktwWlhsTCtqa0J2?=
 =?utf-8?B?ZjBWQ3FVY1dpN0YxNmpaUVNadk5pL1hDTk5ndzlXTGtEcXhBTWxJOUpMVXRZ?=
 =?utf-8?B?RVVaNTcwa1BNclIwRXBTWWhRZUVLQ0IxWk5nNEg4WHhwTnNvTU0yYlBwQ3BQ?=
 =?utf-8?Q?KJJBcmem+OmjmlRg9bEub6MWo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2425850b-2cfd-4ae7-56f6-08db4bc25be6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 10:37:15.5031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydnn68yUoyKjAoKp3Ov7CzEhE9YaBcL9xOuM6J/CFAX7MgOkHznLwv8NjBbWlz3S3dvN/UrgebWxnl+p+N1fGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7263

On 29.03.2023 12:20, Jan Beulich wrote:
> The 1st patch is new, addressing comments on the previously standalone
> (and unchanged) 2nd patch in a way different from what was discussed.
> 
> 1: don't export building_out_of_srctree
> 2: omit "source" symlink when building hypervisor in-tree

Ping?

Thanks, Jan


