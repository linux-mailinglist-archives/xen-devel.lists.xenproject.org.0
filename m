Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72386ADB4B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 11:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507257.780532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZU9U-0004VX-Kc; Tue, 07 Mar 2023 10:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507257.780532; Tue, 07 Mar 2023 10:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZU9U-0004TB-H4; Tue, 07 Mar 2023 10:02:36 +0000
Received: by outflank-mailman (input) for mailman id 507257;
 Tue, 07 Mar 2023 10:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZU9S-0004Sk-An
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 10:02:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c4e53be-bccf-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 11:02:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9120.eurprd04.prod.outlook.com (2603:10a6:150:27::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 10:02:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 10:02:28 +0000
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
X-Inumbo-ID: 2c4e53be-bccf-11ed-96b5-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCK+l0V77pzSDkzGN0N6QKmNZRWLyesDN9Ge9f9abJCT0Vhi0jWj3mZGDS559Exs9SQOZlasUgEFmM+ZBon4PG/NbNOhCQ3OizNT0ESlmazK/XSxyyEzAxyZXD8D0tcfBV4xND8+PUYsrDMjwRpbxxOlk6JZgN2aaOlkRYJa3o9wMhquzVlwakym1vK7vOANqAkSr1ojq5fqDGUma3DrjhWRj6HzqdJol1AgQpVdJMOnGW2Uo6Uzf89YI+5L+jP4JB/kFAt6dUuCLgtqf5+f2xFB9Ymt4xxqD+/JZkd5lOGk0V1OFfv85KjehzAhf8UbiUFMh4mzgeQ0UMyNeFNQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGNNqG66crN0xbi23jiFRqg+lWAEfHlfb9vTyg4VGjM=;
 b=FCCCJ0/IkSap9ULRpEaphA5zVVMMPpHhlLPDn1Pnvjq5o6lMY+v56COUbxjOuLRFyexkSrFowi2cvqsAZPnaSRIaCgL537z0Qr6MvT6nbRQJAKhI7p78kLbSBnNWr6OfgjEZJWMmKckyAlmzFiYrUFHiFq0soehW6InnKAZzImG5mRPM9WKa2m7OBxRwI/yoNEpzaN7wapFhsuSpZNITAiJZ0/KM6PYd1FncPBUW9ZeGa2E6BqqD23ZUu9vZKAu5YTk3pYNMqltIK7jryXZIUCbxopvVjIwg4QmcdklRLCLchlfCld4Je+2GpI/cDpOFdS8wAKc80EcZqjzHsHnaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGNNqG66crN0xbi23jiFRqg+lWAEfHlfb9vTyg4VGjM=;
 b=dUQzCx39h8KVfnWl1cpaPN397S0A7BheUWRphN2zb52nouZt0Vcvjk8BwDirq5IdW+mRE+DcihloXHcGsd4ey/vx+318EQSoCFZ1Ie7drRAQRstryhg8bsFVwk/3TW5tfkqp+xHAvEo7G/DYk1xfT7EDxVzGImPwb02PxBBtTNsNO2Yz3vZ8c43ZAzAJCo5awZauGwp1tcSPsLNtNjonR/u+HMF8Q3g5dL+Pgc/nij3oZ4t1QZIwryhlLMA4LjS4lJxtFahTfm2sK+tQ2aPaiJbssKY1FzOq1/9/AqutYZ8Cq7hLNp+wFyRq+Wsy/ifGmrVNNlCuEjuwxLvxPpgLYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b131fc3d-901b-a4e9-3827-0daab0505452@suse.com>
Date: Tue, 7 Mar 2023 11:02:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] tools/tests: remove vhpet tests
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230306162904.7831-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230306162904.7831-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: a59e50ef-9241-4ff6-fd2e-08db1ef30ead
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ccigRdxNzcZxO6PFiHHn30jrc+1CC3m1xsydQaWFYiFYwqFO4+kFl6N7jbyMJwWr1FKlWX9g/lJpTlPw0JAMlYEK2sCBUuFCSA6qRx1OFeKNiJcsxP4xXeJCCE24k9tUDafhHBqTjRl5V6aj7+Ib6GkDUA8I1SoBWI1907ehmBLLnntNv97jRLN+L9JOw9El7VFiJ6pnByVvlfUCNGL+Lr0ipVRW2oFUE1S43fXZ7zwBfMo+KOyRRbtjjR1eZjFCn6zzHOceO1HqIO9iDQ2Yt16v/+WW8O95BQu9STwiVwDvEG5r4cn4+gfT+dVFQT8hjUa/0EUiV07yzvzVKyAW2mTM+Twto3Ev7sumnKyYspBTFtlF8B6CZEnFA2OGyBv8Bze3qFKY9yWdxyrev0KE0hSWghrhwSTmQFJ1rUQ0OuyLFQ6ZxxfRG1/pfynAgYAE/rejuNMUbybdrPALbBhh2/8DcnF4o/+pUJuq/PLE6AURM+xz0RCEVqJK4oyN6IIWFTrFwQb18NjxQLIozeVRlK0s0H2EtEXAdgXNgrphbEV5WEGkbVgzwHvoF7hS3Tu+fkMYlj+bDfN9BIc7LNt3nC+l59aDiKEIQZYQVoaeoZQKwuN5TR6f4IIur2rhwBmulihdQN9kCoSp97nt6kG9fqOu6dU6Mlb9jGMygexNHWpemOkUWX4Cuwndwa43j7oWA8nhafd1a8qRkJlCJC3tg7Wi247BeNut0lOm2aavVhI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199018)(38100700002)(86362001)(31696002)(5660300002)(36756003)(2906002)(4326008)(8676002)(41300700001)(6862004)(8936002)(66946007)(66556008)(66476007)(2616005)(53546011)(186003)(83380400001)(316002)(478600001)(54906003)(6636002)(37006003)(6666004)(6512007)(6506007)(26005)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUdNL3RyMnhsSjJ5V1ZlK1BVenJjbzZpNUUrRk5MVHp2QmllRkpzL2xrYXJU?=
 =?utf-8?B?MjU1SnlJc3doWUtLMkw0Y2p4eEgzV3pZcHpCVmhsOXZFa1JwZWUrd3hOTVNG?=
 =?utf-8?B?c0hwaldzaWJlWTR3TWQ1emsrVDAyMU9aQWlOa21YaHQvRVZkTHcrQTlnT3R1?=
 =?utf-8?B?NWhjQ0NjcXE3aVBkTnNEQ2pPbW9ubStjTlBrL2FWTE9ka0x5cURwYlpiSHp0?=
 =?utf-8?B?ZlFIWGsyWEF3M25NRHhTL04xRmlBeXFIcFpVS1VXQ25QNlpDZm5PTDlHL3ht?=
 =?utf-8?B?YjY2L2V4RlQ3bzQ2eHI4TzIvQUtKWE1sL3VjMEtFMEIrREVlVFQ2ampCSUJM?=
 =?utf-8?B?RzRUUVA5OVdnSGtHcmdkeWNFUGNxQlN4ZkdYUVo4U2c1WGhHalBZY1AyRmdj?=
 =?utf-8?B?WHl1aWN3ZHpUMlkwQ00zUTVSM1kxMTJmZFNWZVFXQnN6elZFelROZXBIUG5n?=
 =?utf-8?B?dEFmcEhuWXNyR0NWdk9lV05mRmNTNG1RejRRRXlPcWorbElXbERkY1BRRjZZ?=
 =?utf-8?B?MEhDMTN6dnF6U0dhZ1RXRGRna3BwQWdFUUlKbFNZMFlOM1JYU253ZFdPd1NX?=
 =?utf-8?B?ODdSdkJreXFTR0lBeFd1Ti9Zc0N5cnpZelJyVXUxbWVpVVdTdVRqek4weFFH?=
 =?utf-8?B?SlJ5dDM4emZPN2F6NlovN00vRllwNG9pNjY5RW9VWFV2ZkVwbHFNQWJzOHN5?=
 =?utf-8?B?dHNVZ0FGcWh1dGFtRmw3dFZLRE50VUF6bDd4Q29sTmhMeVNMaUtTSU5jQkd6?=
 =?utf-8?B?MnRuMHVXZml2bFlnaUpyU1pWaFRIaVpmeUxBbXYvVlhsTXQ1TlZpc0dteHAr?=
 =?utf-8?B?ZDloem9Yd3dSVms5K3BOQkkwWE9iRmVsUGdTd1dhZExKbHQxQ2FsOHlXTXlj?=
 =?utf-8?B?TmFWZXlSMTdtL1J3MDJjbzRPcjhFNjZ5ZldKb204cFpnTWhnMnhBNjRxRlZ4?=
 =?utf-8?B?VGhWbWc1K3JKdFplVk9oa0Y2UzUrdllQVDV4R3NzbnRkTXF4a3ZOZmhNcy9G?=
 =?utf-8?B?MmhybTYwaG5zTmg2YS9JL3ZXdmN2RlpmdDhOTUVtMEJUV2greGJYbDd3ekNM?=
 =?utf-8?B?OHNKWmdGNTdQSFNFSGwrQkZWdmpNT3RpenB4SnVxWXd0Qkw5MFcySnhvTU5l?=
 =?utf-8?B?cmliTW9XYVo0MUY1Qmo4NHcwckZRM0loOGdLZG1LVDBMZGNQa3Y1V215ZFlq?=
 =?utf-8?B?Zk9INUovRWtuajk5d2VweWJCTDBpQWd3eGZ0djF0L0tiV3RhbmVpdkZEekkr?=
 =?utf-8?B?cUozNFlJUlA4VXFEUDR0SjY5ZVlMNzVTeVNJcWkzTGp2eERqeWZPTWhPbnU3?=
 =?utf-8?B?d0cxT3RraXRoUnZha2hNRTArSEdiUzdBMTRIdm83N0FSTE02N2E1Z3JNUXJG?=
 =?utf-8?B?ckZ3ZElCNGgwSFNtcGNlQnd0TjF0NWh5b1R0K1hiT2dCZTI4MlpCaWFxbmdm?=
 =?utf-8?B?STFyY1dLTTc2R2V4NUpvQWY5SkhOREl6L3JEeGpCZkNrWXY2UHVUSlYraFVZ?=
 =?utf-8?B?TU5BazZHOGNwMXlJbDNsbWZ2NVFlWkQ1QVNpYVBzQzRSS0Z4Y0tHNnRHQWVL?=
 =?utf-8?B?eU5MbWtOTWp4R29LaXBMVXB3VEVkR3VJU2hRYW1WZmVDZzQ5STVvVlpGeVNY?=
 =?utf-8?B?MlF5Q3owRmtCd0J1YUxEb1ZWWXRRRnRZTnozdjVjUFhNOEhwQTM2Y2lXL0hr?=
 =?utf-8?B?SXl5TFVYSnI1SGZIQlVOU1FGQXhJcTZ4ZUZYSmZVbDdyUWZFTlJjZWJqNFpt?=
 =?utf-8?B?OVZudnU5MXpsL0gzbTluVEJUK1NnYWxHL2JiUjRSd3pONjhTc1JnY3R0VmtV?=
 =?utf-8?B?MnpZWWQyY1NYekJEQmlKWEhpS2NKbHBtLytUS2JjenpvZER0SXRzc0VlU2Jq?=
 =?utf-8?B?bkpoNk9MeEZxamxJZDc1djJLOWNrZmgxZWg5V3dmWUVFeDZIODlSMWgrNjIw?=
 =?utf-8?B?cFN3UldYeW9PQUJTM2JLUy9IVVVXbVR6ZHBKNWtVOUNuT1V3ZVdYVHZaQkYv?=
 =?utf-8?B?RjF5ZnVWN3VWMXQ0K0c3Z244bzNzdzNwdFcxN0Q1TXlUNXZxY1ptZnJkUCtz?=
 =?utf-8?B?eUlCdnh1MTBWUGpnL3grTHc4K1hhZDFSN2czTGNKZjd6dmExV3k1VmdKZi9l?=
 =?utf-8?Q?FhaXpGezrNPfIR3vM5CyZdxPt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59e50ef-9241-4ff6-fd2e-08db1ef30ead
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:02:27.7570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCOUM/N5qMHyX/ye1+O2Rxu3RoUamAKi3vHgEUpLeA2n4EuOnLkdy8Wx0Af/T1GwoFBoH4EeRaf4Cw87EJgcNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9120

On 06.03.2023 17:29, Juergen Gross wrote:
> tools/tests/vhpet tests don't build since ages (at least since 4.10)
> and they can't be activated from outside of tools/tests/vhpet.

This isn't exactly true - see the run-tests-% goal in the top level
Makefile.

> Remove them as they seem to be irrelevant.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Andrew seems to remember that Roger wanted to keep those tests, but
> this information might be stale or based on false assumptions.
> So this patch should only go in with Roger's Ack.

Having tried a little I can see that it's going to be quite a bit of
work to get the thing to at least build again. In fact it looks as
if it, having been introduced in 4.5, may already not have built
successfully anymore by the time 4.5 was released: hpet_init()
takes a struct domain *, but is passed &vcpu0 (matching what I can
see in 4.4); I've noticed this while trying to figure out from where
it got a declaration of the function in the first place.

Nevertheless the test once served a purpose, so it may be worth
making it work again. So yes, to decide which direction to move we
will want Roger's opinion.

Whether just building it by default is useful I'm not entirely
certain. What I'd consider more useful is if tests like this were
_run_ in the course of routine automated testing.

Jan

