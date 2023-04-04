Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE036D5B9C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517683.803392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjcfx-0005Qy-Uq; Tue, 04 Apr 2023 09:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517683.803392; Tue, 04 Apr 2023 09:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjcfx-0005NU-Ri; Tue, 04 Apr 2023 09:10:01 +0000
Received: by outflank-mailman (input) for mailman id 517683;
 Tue, 04 Apr 2023 09:10:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjcfw-0005IK-7e
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:10:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 778422a5-d2c8-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:09:58 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB9852.eurprd04.prod.outlook.com (2603:10a6:150:117::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 09:09:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 09:09:52 +0000
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
X-Inumbo-ID: 778422a5-d2c8-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRN07gEljZ6tFkm2xgW8JexQfh6/erScfgyrKAbxUeSg+lFIlz6gNPqp3fzoj3uo9Elbr/gyXEj3mHALL9kEgN1Rzgf7ObcqbMMZt85L96lZnQtz+9OT6y9P3oD5GzoWihiX5QUFXcezzD/8Yemm+6wA3cAWhHA9jd5YMjnufAZaop/GGAXOmPRNpquveB3X1NnY4bCSvp6MIfi0hUwCX5+zufYxDzGs/hjU2Aw8+/LNVNHeE1S4CqcPKuaa7sCe1l9vZJrOLlupHlfRFubdFjbDmMi6yRfDO5ulZe+Z4N5sF9j3wFyNzvuCgQa0+z5SH+iacpg5zfzK3PqJIBxrxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1Be+8SKWFkGjv1O8hnhZzzzbBtxIIpMpvWMe0CFsrA=;
 b=TaEVGTN2bzVTPEfp1TmP5P886/nYF1Lw3W1IyyuLYl+Y76K5LHN/GnfQcb3zV97SOlwyB+C3/upAk8DiOy0KhmVzp5PyqFI+Wt9j8gSja6jRL+2KjcJIfdqIMG/qeocEOOz3mMx5fa2LBFdfy+0jruAf5uXG1kyfZzYeX2J6ZxM9WciCntwLeD4tdVio3tJzFbQC+KUwB3SCf7Ped9iyyVV3N0HfEOzirmdLIqovoKd8f5lOCvrBpsTJ1TPDMLH+Xn2wF+g8n3rFqVrjq6gHyZW+TtAqC5S1dlRzzFIWGugKu5/iHIq63FEWoxbm2UwEmzF29ehUdD+4skcnipox/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1Be+8SKWFkGjv1O8hnhZzzzbBtxIIpMpvWMe0CFsrA=;
 b=O7LQHCWoscDHDcWfIxBiv59wntLBoUx3AbXlXhJ8NTfCP9zBPdVjrMU3YUd63mIjrcYXC9RgEa3iaUGx2Br6A6ABpx/uS7WrJNO6ruf+huXSxVBXpzf9qF6y8aI+CY/rTTS24RgikEY946DpsBuqUqPYUorVz9zJLMAYp6eNVN3Lbx04CfWVkexa4MGgK9bMB6GaPTd8yDcnJ5oCibT2KNYF9tKQX7fH+Yn99shS+faO0zuVWO2qtvVW8+VgN5ya/6ooUAutquM17YjSmrZCrWxRCg/cqUEeCjrzLWl97kLwjDVbFzjSGXqWt6zKoA/qkKhmXZnkTBTEB7Ra20aZiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <358e9788-b930-5c51-1e89-232be43f83e5@suse.com>
Date: Tue, 4 Apr 2023 11:09:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/2] xen: update CONFIG_DEBUG_INFO help text
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230403162823.30681-1-jgross@suse.com>
 <20230403162823.30681-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230403162823.30681-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB9852:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f60c38f-c882-4ace-cb2e-08db34ec5926
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bNGVfm1DEgbv6LJ6mrtvh5NIHL93bzS4wfnz/5POJskHOhYnRuFv0OXETJbEmpQL9d7EPu114z06cOzKmnJVLIlIgLce+p5njr//coY5ACMve/YGIhlAPt12B02zZ/28crR4WMB1suBVGXSLJVN3QOZmfyPeYFNw5wqxuh5HExcKrQ1DehcI93R2YoIFU6xwrnRV4DXidYm6OUOl5WSoP4EzhTBYTZJJ6lmRwiR46gETjPYWJIVqw/RQ8v41NyTj6OJeFOA/klZJ5drZmm52ASYOyKS9l6wmGym03kPVfPglW2zHzBF0/6MfqGPER3xDjw0My32+mRk/Htd5wTWbhayUe2GJ3PmLngO+CEGFueVVRk/2Dirq+kbTMyYt8M1uiusWi35esr2lPvcVl8BefIu+7neiNHAPa7E4nWcC354b7bnXuF22T0P1l8VSkzFjGzEOeaVaRmgxbDgnWbdwpGO+l7K4ck3Ul6IUfW9D8L3SeSAgg3yeKfWYVpbLSNq4sHDH/ScM+qnCu55OYIlbPTMrH92cGPDCH7Qt7Ft+5mRGOu4i8QrdvthzsH0M0nzsU4NEPTHNpvtr9rHlEqpifxOv78J0PutqDnd5hQ0CAfHbkfyf+TyP3X4I9pz/z+cecbYY5DPC1to/97NJgyg8IA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199021)(6506007)(186003)(53546011)(83380400001)(26005)(2616005)(8676002)(54906003)(6636002)(66946007)(41300700001)(37006003)(316002)(4326008)(66556008)(6666004)(6486002)(38100700002)(66476007)(2906002)(36756003)(478600001)(86362001)(6862004)(31696002)(8936002)(5660300002)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VURNVGZ1L0w0TmV5aGxKKzlRazN3QmRVM2w1SzUyU0FRWHNCb3FqNXl6eGY5?=
 =?utf-8?B?UHJrNlJEMldoRjR1T2dHS0x5Lzh6RmJycVdvd0YyYVAvT3dZcU1INHFvbXNt?=
 =?utf-8?B?ZUFMaGF4TzlQV3RWUWlFQXVWeStqeU9sQ0NxbXEyRzczb1lSODE1bG9WM09k?=
 =?utf-8?B?YVRVMEZUTzRQUk1CMnAwY3E1YUpGeFhZV1VFWUpiSEtlck9NcitJYWNjNTlr?=
 =?utf-8?B?U1VCdzc3eHRKaVBiQlVLcENNcm1qSWl2Q2ttMlRUS2dxYnBpblhZN0o0TU9q?=
 =?utf-8?B?WXFBdWJyTWRSMUhCTlRaY0JJMkpRbnFJOHMwQXMyampSekVkYjZrd1RYSExD?=
 =?utf-8?B?aFVkSk1yZktxOXY0SDNYMHVaZTJVMW9SVS9xY0l6M0JMSHlnZjRhdVFzcjlE?=
 =?utf-8?B?KzEyME1JR292bVJ4UlRFbVlkZmNGQW9aYmdsYnNCYWU3ek9LZXMwRnJYaXpH?=
 =?utf-8?B?NnZhSC96THRub2ZVRG1WV1MzUmQzZUNUMm9PZGprUUtlbTBVMktFSnkzT0Vr?=
 =?utf-8?B?c3p4Nk55Q0d3QkYyVHFIRFRubXQ0NVpHRmVyZ3NPTTV6RUltTmN4VEh6UlNT?=
 =?utf-8?B?VXVHdFQvTnFRMUV4WDlEWk92U0phanFka3ZZQUJDamlzVzBLNllNdFh5SERC?=
 =?utf-8?B?STREOExGbkpxSTBhdUlBRkVhcVh6eDN5d013bDBsVGVwaFJDZFJTWStHNFdI?=
 =?utf-8?B?NXNuMjArZTRueGxhazVtUlVCaHEzTjg3dG0vRTlZeFRVWDdweWQzM1Fzbm93?=
 =?utf-8?B?UGNGMXU4YVJMUWdSdjJFZS9rdmJUc3IwVEEzeFdHanBnVFFpSTJWSEE1WTdJ?=
 =?utf-8?B?OWlVcWMxaEVPRWY2b1h5TThGWXFYVXBsdkZZTWpZZEpKTFY2V0hrS1lpYm10?=
 =?utf-8?B?ejF2Z251Sy9xLzNmdFNtODhneHFlczRtQUV3eU5jRGpGVVV4RVU3TDJHZTc0?=
 =?utf-8?B?ODVJOXZSZzY2VEVGcy9RYld5OGtvMW5QMUc1WXB5aXIzWU5NTmhqZDRFcm5u?=
 =?utf-8?B?TTNFMHI5NjY4bVlpV01jVHFpMHhHdTFydFlJdUIxeWQ3ZS9Hc0VpQXRBUUo3?=
 =?utf-8?B?THQ5QTdxZnFvQ3JoQTBQZjBrUDlnZVBtTEUvc3MvL3pSR0Vwdm5MQVFhUDFw?=
 =?utf-8?B?L1hDQ2lKVnZzWDBHMjIyS3NMbzdwKy9iVGorQS8yMW5IL0U1WjB3bE1CT0lG?=
 =?utf-8?B?dEVPSFhJUFFyb0xSczFWYnkwSlJ2WWwzSXRBajNsYWR6OVJGZXhPeWlnbTZu?=
 =?utf-8?B?Y2tZS21TazVzV1RCbVQweU1WbUZpaWVZN2pLQVZpc21SMzJhQzZIK09LR1hM?=
 =?utf-8?B?bHMwOCtyMzg4Mm82NXd0djd2dVRvVXdIVjM0UVlQdG9jc1AybFRGWHNMRjFE?=
 =?utf-8?B?VEtGMW5LcisvM2k2U054c3JOdTJLVXl2TDlZLzFiamJXdUlGaXBKN0ZZZzZt?=
 =?utf-8?B?R09tMlI3SmJuLzVaclNuaFd4UVR5Y01xR2phVjMybm8vVmM0WXhtbCt5OXQ5?=
 =?utf-8?B?Mnp1TERuYzV5c0Z4N2lXdGJsTXYxaUNKdm53b2hGS25ubnVERDVUa1VhOEV1?=
 =?utf-8?B?cE1ncHpad2hYdEJ0NmdCVkREaWg1RU11RDBGanFwMkNaQ1d1aG14cW5tc2tZ?=
 =?utf-8?B?M2IycVRRSXRwUmpXU1kvaU51anRZYW9vSGMxblFiMjFjTWJkS2MxSzluUm1w?=
 =?utf-8?B?TmhKWGVaYk1jRkZYY2d0d3RwN05xY2NYbDkyTk9PSzA0NzhrbDZPZEVFTGZt?=
 =?utf-8?B?T2tyZ1hOTlI2WFduOXFIcGprVTRPVG1LY3oxd095YTA2SldWK1JkQUVkS0li?=
 =?utf-8?B?RHA2S0JsUUE5OFY4TW91LzJBTVB4S0FBNVFwcWwyaEQvc1pyai80K3lwYU5J?=
 =?utf-8?B?eXJuUkpBUGRGK01Ocjg0VGpUVjRET00xdnVXRHJBbUk0MDUvc3dweUM4Mks1?=
 =?utf-8?B?UHhmVE5DMys4dHNYWUhKTTBCb3hZMWpqR0V6ZzR2WWlaQVl2UE5mYitMZ1NE?=
 =?utf-8?B?M2NNZEs0elFsS1hJVUUxTnp0QzlLZC9oejNLZkoyRGtBMW5DQVV4bGhMdnFF?=
 =?utf-8?B?SDBGV0FkaDZtQWNaN29rNnlucHNEc0NYWlJacTlTRTNWZ09ubkhERzVrK0d0?=
 =?utf-8?Q?GfWahpXOyFvgpTycaIxhsdDol?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f60c38f-c882-4ace-cb2e-08db34ec5926
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 09:09:51.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QibiVXN6MeP/giY7oyX+opy/bECYf+ZnpTjPXwwHJ1Zoo7SEypphMT1WeRjQ6iriE2MU+T7PaqRNGAhTHxSlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9852

On 03.04.2023 18:28, Juergen Gross wrote:
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -15,8 +15,14 @@ config DEBUG_INFO
>  	bool "Compile Xen with debug info"
>  	default DEBUG
>  	help
> -	  If you say Y here the resulting Xen will include debugging info
> -	  resulting in a larger binary image.
> +	  Say Y here if you want to build Xen with debug information. This
> +	  information is needed e.g. for doing crash dump analysis of the
> +	  hypervisor via the "crash" tool.
> +	  Saying Y will increase the size of the xen-syms and xen.efi
> +	  binaries. In case the space on the EFI boot partition is rather
> +	  limited, you may want to make use of the INSTALL_EFI_STRIP make
> +	  variable when building the hypervisor, in order to strip xen.efi
> +	  before installing it to the EFI partition.

Hmm, INSTALL_EFI_STRIP is only a courtesy to developers wanting to install
xen.efi directly into the EFI partition. It wouldn't affect the normal
flow, and hence I think this wants expressing here such that both kinds of
people have at least a hint what they need to do. I.e. in the normal case
they'd need to adjust the way xen.efi is "propagated" from its installed
location onto the EFI partition, to do the desired stripping at that time.

Jan

