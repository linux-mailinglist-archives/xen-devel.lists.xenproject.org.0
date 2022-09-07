Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE5B5B0253
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:05:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401259.643071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsrY-0006Hq-Ff; Wed, 07 Sep 2022 11:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401259.643071; Wed, 07 Sep 2022 11:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsrY-0006F3-C1; Wed, 07 Sep 2022 11:04:56 +0000
Received: by outflank-mailman (input) for mailman id 401259;
 Wed, 07 Sep 2022 11:04:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2ywg=ZK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVsrW-0006Et-Fx
 for xen-devel@lists.xen.org; Wed, 07 Sep 2022 11:04:54 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50048.outbound.protection.outlook.com [40.107.5.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5d6a807-2e9c-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 13:04:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR04MB3255.eurprd04.prod.outlook.com (2603:10a6:6:c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Wed, 7 Sep 2022 11:04:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 11:04:46 +0000
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
X-Inumbo-ID: e5d6a807-2e9c-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0fKlS5aWt4lyEJpOnccUkFWUkPv3NtFZgBZS9xX3OXzLE8jiCUJS0U4h699DdqcGC6Z6gmgS8paHUOc+SyLHi+UspKCE3+aImSsBEzah+qc6u154X/vhTTCciqQJGUn6U/P8ShbJeY/InoI9wHn8Gk9nvoM8Xs7sqhz8eT9g4cCv7EaD7rVX3+5Hw1efCdJ1tKDWHlx7EppCpDiz8jUnHiIYUd/d0P5RJCECawokTY8hvnfWGFb+5687MBNWccaRAgadKijT941ZM52YZkK4SXP1QuE2pojFvdy9z3GVyT+GmZL3Sy4PPFSSjHBFZ8+aza3LOoAIVxyhN031AW3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ik6WWPDhMgvJz79Hw2IXhhmGGpxzvPg3ymGHoWY6YeI=;
 b=HHrm9Wlqqpik94DoMEeIyhLeMVqHczR2cu/RYz/KzcP/SPOuwK1BKl3h7WguWSU4FWb27VpK0gD8s8MM7NOCsZgrPmtLL8Ucwvz+Ph61bzdQy6hRvs0xmWtr66xwqCFNW93CS6H91dqBnK3lTg4gBXMS9+aHFPH9KcxFak34i0MurH0HGGKepPjZb0x5r0/a4zirV3TrZPv1xtcf9HJMqTcenF3c8uRQuHUmf7SIY3zkFK7drWBcdzVVtBeX4J2mK55DtYkzMBhlkB5bTLS9rKzy02JyfTWXDJ6r5tfnbn9D63JvR4ZY9Tf460/wF54I3Tv3MryoytdY4q2+3gHV9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik6WWPDhMgvJz79Hw2IXhhmGGpxzvPg3ymGHoWY6YeI=;
 b=MXlNZoXxE0zQyrir5M1FxJ5gkx3Ts+BTa8cbph68nPoTM3b74yuxHomeX/yDeKtmnm3Cgz5Lr5uzvb6KMdRjRu23E6fscZMGSGF9SGNgsPOpFes7sI0AmdtdtVvqlH1DpfLNcVbSpfvICHkmVot/FEbV1xxqOpBy+C6UYOvh/kAJHg+KlDjhewpsxhm2/u8MEVwIYa9S6k88cyYXErD/WUbioBbljkThXWaaBDx/k8/PnPLdYXfu3+xdDloQjjA6RIOof6QmEaP0DyToVfdSlHqCjkjlvsajBlufhaWaWN7/dMV1HaC1jnQs/aHPLS6VfpSU+ju3UNOeXrIPzzOaHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <568b5180-3ebe-106b-0cae-7089ee4c77ac@suse.com>
Date: Wed, 7 Sep 2022 13:04:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] .gitignore: Add init-dom0less
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <b349ea9e7e2946ee6b3bc7d40462a4948e2b53a9.1662544834.git.viresh.kumar@linaro.org>
Cc: xen-devel@lists.xen.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b349ea9e7e2946ee6b3bc7d40462a4948e2b53a9.1662544834.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB6PR04MB3255:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e9e047-67a5-4d83-b2e9-08da90c0c67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Am9I1u1Yv2k/KOId+eyKY+JHMMH1996auwzF/KkXJvdU6i3qEVF+ZP/nisfLdSPCusTf6SNCXkwpnScrq73HU7xptYGe4lON4SKGvvX+zGPt6/8niqvPtqEKAPr2GUEeeJrDPqnRpyp1qWVCL+QDUiNkn9W8ap6FSN6WR7mV31Giffu8DFnz6q/gXzZ+5Zl5QqaqPmBMghjAWkqTcHfuB1ZUaLOmQ7tDRAEqLWnpVNql0tVr5rg+if2K72YTZP+xD4QOLomWUXvWKjvp6XeiD1NvaNZ3BVdZedOpc/NkYPsOq7jfkTA3jnDq3aN9ja5jojdLU2E0SxQSRoqNrTFJxcQkHK2xISSHXbN9qtW6aLJ3PmlmVtcZXCMzSJoiEvmdtglbcLdvmSPj2br34YfCLnV2G94UNKDEpeRICiTxwziR/Slywiupi8vgXsbWJmJJfB4d3z20f5d5NcA+/YuE5VYHJAIYa1SX6yPHp8ZEVJZLQB4WKyRjDyKAZ57sQzItjvbq9CEj4FOMCgpjS1IJSv4aVPoB5ZP3VRvAzhnK2obRDbLcUKkEc3kuDVsXlfJP8xehugIJqW9yKaFTOLxC6AEHPVcWKpUp9UzKMBcR6geoXtBtVStv4QjVjD8DVyljzVzGhmpLNf6VIDvr7i5KvmMk2K9hZ6aMuScjDKdq3AWY91mXq0O9kHmtjdiqKmzN9IDy5nHC4WIeIEcJE36cHPhTcooL9Ca0W2neFXfCJf+DKoUbbCe16MzPBC/UqfiGuEewsHImFamgk9d0B7SjMn4oFpOpfVieIAZ9jSRkXDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(366004)(136003)(39860400002)(6486002)(26005)(36756003)(2616005)(31686004)(66476007)(66946007)(8676002)(66556008)(4326008)(2906002)(186003)(6512007)(478600001)(86362001)(6916009)(4744005)(41300700001)(31696002)(8936002)(53546011)(5660300002)(6506007)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enB3ekRwNmtzWFV0cDk4dHJPYmlicXNWS2EwdzV3TzQvZFRKRldCeC9oVzZ0?=
 =?utf-8?B?UUdoOFNrK2tjbU9UaHRoNHY5cHZTTHpaTjcya2xjRENNRGU0ZjZub1VRRVQ3?=
 =?utf-8?B?ZDJFN09kU1plMzk4ZnVKYVE4YVJYQXo2SWNqd3J6bHozRkRNT2cxWGhlNFhN?=
 =?utf-8?B?RWNBL01tSmt4Tzg5MnJhV1RUR1JZQU1ZaDFzUGVXWHN6V3VJd2V1cXlHQTVo?=
 =?utf-8?B?b29PWi9vQjJsNzlBRHRDNFNKN1NlUG1lQzVSOGhqWUNiSHV3dXI3NXNRdWZv?=
 =?utf-8?B?bkFDZ1E1QXBhaEN4alg0KzROV1I5M3Nyc01iZVZ2ZGlrVDhWUllkQlZZMGpD?=
 =?utf-8?B?Y1grQkdEcGptNHYxcWEzd2NFSG1NSEVSZ1oydGNZTnlJTHRLRFFpSlpKQlZh?=
 =?utf-8?B?b0VNV0ViQWJHVnVFWTlWTXFhMFRFTTgzRVppdUNFR24vOEhaampWL0tOTFRm?=
 =?utf-8?B?YmlINnljRmFOeDFmb3pOeUNZZ3JrTUF0TWcxeHFmQVpvU0Z3NEw2enR6MDRn?=
 =?utf-8?B?R1plREpzNGRQTFRweTV3OUZDWi9GQ1QyRUhvTzBQQStna25LYlY0VmhIcDZL?=
 =?utf-8?B?VTFtOXNDR25RbnN3Z2ZBK2NoeUxBWGdYZTJTeHZDWUZxak02VWJNU1FGMEF2?=
 =?utf-8?B?YTNTYVIvZ254NkZKMVJvQm1kZlV2aFpiNEVnMXRwdTNhU1BOdHpzTHlYZE9D?=
 =?utf-8?B?V0YwY3ZrL3AxUkczZ01HUVhMc2VyUTFBd1V6SFpiTGZ4RzFseDdxQitxMldU?=
 =?utf-8?B?ZUZLQ2ZEMjlJbWJnaERqbnRMeDNHd2NsWlFEOVFiMng1bDZzY0lJZERObGIx?=
 =?utf-8?B?VHQzWFU0dmFCeTZrbnJQdGpaeFBEamlHMjFXUFlsb1ZuOUdxVFVCc2xpOXlJ?=
 =?utf-8?B?dlp2eFpPcGlaN1Z0a0kwMTF5VEFtQWkyR0JEelZ5RFRZcnliOEpFZUV3WmI3?=
 =?utf-8?B?aDhwVDlEeU1jeUhBSS9NSWFsOHdmUDY3aTBXeEczYUk5elExZ3Jxbkk0em1t?=
 =?utf-8?B?S1dxYzJoMWNZUEZWUkpEVGJoWEczU0M3L0VxTm5IVWFuNWpBS2ZRUmtoMUcz?=
 =?utf-8?B?WmRPcFE4QXp1RThOU3o0SU01YlpuUDJCQWtERzk1ajBxS2VQZkVVejlta3dr?=
 =?utf-8?B?b0d0blBJNjdCc2pXUjRITUhpVUJId2c5NGUwMGdzeTVHSnhEd0NiSEx4b0dF?=
 =?utf-8?B?MVZxUCtyaFNqam1KSktjMGdRVnJwc0s3SG4ybldmczFqK0hWRGYrcHVRZEFJ?=
 =?utf-8?B?RGdGVVNoYVVzRDl0WjA0ajZ1ZkZLQTdqNEpCNXRsRzMybUp2Q0hJVFQ0bFFt?=
 =?utf-8?B?NVhsTzV2RmRUOGpKdTQ4aVVvc3YwMm94ZWxLUXlNaUp1ODRkT3RVVVJHS3lB?=
 =?utf-8?B?WGtwYkl1aFJWQ0ppS2E3bEpESVRObU94MGt4R2hQSkVVT1RUSDdkc3RnaGg4?=
 =?utf-8?B?UFlJVitxWThsWDgzd1RjTkNCRkNOWllFSm00UjlrSFJOSEpSSXcxV0NZT1Fl?=
 =?utf-8?B?Q21KSVFOMUhITjBHSmlScExlRkd2OVFjVVZGaUhGeEx6aUxEUHhsZzR4eHZi?=
 =?utf-8?B?YnZHYzBVRmJqRnh5SWphbUl0M2hkTlpqTG8vMEtkMGZBbWp2cW9iQWpOMmhr?=
 =?utf-8?B?Sm5pQVdTYmRmZitvYmNGUmV0bEZsYTMwY29JWFpQL25QWU5HRm9LUlJwakVO?=
 =?utf-8?B?VzRiYVMwNmd3anRRcGZUUmRXR1lVSE5uL0htNC9JTnFxbFpWaWJRcXRqUmRG?=
 =?utf-8?B?bHhNYTdXWlNCMWZzMUNmZCtlQkt2TG9PeGZNc213RVpJUkdhR3dJWGR5bHhE?=
 =?utf-8?B?bXk3b3hJRWowM0ZNa3B0QWJoTTcrbkQ5UVQzK1N6dm9PelR1ZEN5OGRuWCt3?=
 =?utf-8?B?QnFEbGFNRnVUV0x1ZmQrTmVEcUxPU2RVL0ZIUGpRSmM1dkcyVmg1MUk3SlpS?=
 =?utf-8?B?RFJXVTgyOWZtbWg4TDNWQWM2VFlYNjNSQ0F2Y1E3T0dHdGE1Ui9XWFkrZTlo?=
 =?utf-8?B?ZUlqb2EwOVJiMU9JRVhiS3FNeUZhMU9YemVYRGNLa2ZrRVNnOEVwTk1nK0ZZ?=
 =?utf-8?B?Ym9SVHNlNHFIZjhyUGt0aWFBVElWekQzQ1hpK3l6R0ZtdzdQUjM4WndXTEtk?=
 =?utf-8?Q?EW2N4PGWbGYKoxgFuyfDBZLI5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e9e047-67a5-4d83-b2e9-08da90c0c67c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 11:04:46.6090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czbkwD5LyYz0Q8A8zlGU2whZHqQh1Ottd0s02K2u7yzBzDE2I9t9KQd4FjHrT3NrQRnQv21sexEcGVdlwFcsaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3255

On 07.09.2022 12:03, Viresh Kumar wrote:
> Add tools/helpers/init-dom0less to gitignore.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 27881c976432..9f9f18c97d5f 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -170,6 +170,7 @@ tools/flask/utils/flask-setenforce
>  tools/flask/utils/flask-set-bool
>  tools/flask/utils/flask-label-pci
>  tools/helpers/init-xenstore-domain
> +tools/helpers/init-dom0less
>  tools/helpers/xen-init-dom0
>  tools/hotplug/common/hotplugpath.sh
>  tools/hotplug/FreeBSD/rc.d/xencommons

While easily doable when committing, in the future can you please pay
attention to pre-existing sorting? With the insertion moved up a line
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

