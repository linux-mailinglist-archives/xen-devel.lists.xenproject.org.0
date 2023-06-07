Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635AF7261F4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 16:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544821.850852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ti3-0004Ks-8J; Wed, 07 Jun 2023 14:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544821.850852; Wed, 07 Jun 2023 14:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ti3-0004I8-53; Wed, 07 Jun 2023 14:00:23 +0000
Received: by outflank-mailman (input) for mailman id 544821;
 Wed, 07 Jun 2023 14:00:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6ti1-0002nN-1X
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 14:00:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a30e91a3-053b-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 16:00:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 14:00:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 14:00:16 +0000
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
X-Inumbo-ID: a30e91a3-053b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIOnB8bAhdTwu3jqHJBQtU43UihaPhVwcCAZq8lXs6BeupIyFJppQfkUnztbcklCsTX69592isNGlBNgL58nADUxvEBvqUMUFJNKkN4r0fZlWKGu0WFOBuxxxdJpgBfQQMiSezZMWDaRabYYnENBvKcYUbqqLZz2yDhrHjNyhVaWhnjm3bxzDbhs5bvyXm+BTy7ltIdpRM92CPZYMC11pQdDX+lVRSf8ON3dTfOoLfo2Oj1F7tcEzDxGNWUj228XJBtUAJ7IHvIlICfIH38GN8OhWfOiaBPGFqzADWIJrNm23QZNc05IRst93Xhyo6SY3J6XmVEuwr55xN0BtqKH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riGuLPKZzej+EH/OSBAvKcqPD21wGhsOdJJjNaisKXo=;
 b=mTwur1gGEeMeaf5I+A2GtkWA/L5tc6nAnlb84fiStt/zioKnzVpb7xeZhUqDm/BzIK8acCFI18sHRuVu4RpkoY5StyzN6NPRov3aAQzkPUNzy1Ms2/tJSxJS5vtLj3F1JAHkaJQeL8h9AHJSVlN1B/xw0xzYtxdJPRP+fq7MVMv7By3F3gRVjhH2p8xQ/nriLCBc/q8f5wfYjyZSU6Bxlheokg9M0BVDkLLY/on/zp1dD9027mByIHeY24BXUX7nOkRf5ljbt8agUB/dSyM3Q+Nm5T8rcZu3KujKgy0KC46kUo2Ngup317V/vAeBXX+SZ+62K30lqlWrmUctbtDngg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riGuLPKZzej+EH/OSBAvKcqPD21wGhsOdJJjNaisKXo=;
 b=AgoQo99KQdxmLse3tb0jh+hnmCVUPAF4W9l8B6eOGInKHV0cipracIDjBS0CdC43gLr09BxEWagIazHOV+IxTp4dL/QQtxEXLD4L9fsYg/qcaqWF5CMa9lRRv1R7WQYAcMf2ytqX16xchwsljAi5CDhCQcvBSWwVzWGGZn4fkSDMPuSHLTe9rp6n0up05VG9P38mquEWgHUOnZkI5cGeWD8GuDjsqlQGFgHsUAW7fk2w3SoHbn2pmYZaatIh5xtItgUz6yfNbBTgBKfuJDdRdN3KwAfqH6nH3tOlsiyJRDPPFviAay6jF0ukInJySP4FuUiuhIV6c2q+vEcRn1zJHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3da62adc-b307-6505-f333-a7b211869a15@suse.com>
Date: Wed, 7 Jun 2023 16:00:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] x86/hvm: print valid CR4 bits in case of error
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230607134638.53070-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230607134638.53070-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8946:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e40393-1e8d-45ce-a768-08db675f85a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uxFGTkbZR36pSIXQpSVIywvb9DvIPTb5ZFLNHwkmxsZwfIseTiIStcx1T23LmYWpMUrzRWWidxsvs9G3g3/jNtM6cMqDsf6L1zMMO+4Cnh4rHYHsOIQQZ6QYSiCAmTuJZYcGiaTEMrBnSjhf6Mx8UtLb/4HbQyfcpEE1mocVWgMz16K4eMpox32U2vs8/i4408+hckCH0Zii0M6cW/Y8dqKxwk3gDiZeZATTgTHjPPcA8jq4qzyZQa6g2dxSkjvfeRBQfsxNpywkNQFWyeLp1NdxJEj9pkkKDsR8iFJRCpmiDjjRKiq83kiExMelgjM7nllAm0pJ5TmVTb6pWeqXpQ6rDGpX1R9GQkmZEwF66NzHtd8G8lu7qYt4qifCt3fk1eaht1x4oyJ5HzX0ffFLC4Ydx+xvpfXJ9Zt/TNF+lza7AS3dRy/5mshGgxyGHIO/W6eZbvIIpCorWRojUk9jHGRkdBJxT3SsAKlkqKAiLn7w4eZQYh19SGBbIKri4x/HZKa843W92Oas37wYPg5SDrOa7sIRhPgZYVpiGaVfCGAX/3sCCaqLaqzmk6V2EKN3zr2GwPyMGrLepjCWXJSqs9Wyqh8GQGvam+g5XyKXhXqNDvyzzyyA1c/U/fP87nIGNfaqxHakAndVWRHkCKAwLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(5660300002)(38100700002)(53546011)(186003)(6512007)(26005)(6506007)(2616005)(83380400001)(54906003)(2906002)(478600001)(86362001)(31696002)(6486002)(36756003)(66556008)(66476007)(66946007)(4326008)(8676002)(6916009)(8936002)(31686004)(41300700001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk94aEJtNFZML1JUZTY3VDRpcU0zVS9XQVdId1NyTDhNSFZoV1ViaTFKWFRG?=
 =?utf-8?B?dGdqMWxQZ0h3b2F4TTltNTkvTzhyRnROMDdXemx4U3lmMzAvbmNmTCtqNWpQ?=
 =?utf-8?B?ZE14QVdzK252K0doY0xyL2Q5dnZ0TmtJbUd3YmpSOW04bVVjM21VL2s3WnBY?=
 =?utf-8?B?OTFHK3N2MllON0dmQ2cxVS9lOGVuT3FLUXhCamNjc1hLVmw0Z2szdTJKcnhF?=
 =?utf-8?B?dThiTTcyTEsvTElvT0VvNlFDdEVnSHpQclFzTE9ZNUQ3KzFZOGg0OGRuM0lw?=
 =?utf-8?B?M28zeDBYYWZ6aFlxYWtlU3VLeUhiZFZRVXY3Sk5QOHJqbml1LytXR3lmYlBD?=
 =?utf-8?B?Rk5VU1hITEF3MFcrREl0dHg0Wng4MUJxUUh6end2WFlDNUFmOWhPV21OT0pp?=
 =?utf-8?B?eWsrV3M1eVUxWEQzOHByNmZRWjEwMzY0TW9KbWYzbExTYmIvQ2JTQ1Eya21I?=
 =?utf-8?B?bytoQml5c2dFZ2hIaU9RdmRDYWVTaE5RbXhtMnhpY0xyN01EdDYrY3hKaDNy?=
 =?utf-8?B?dDUzZmM4RmRzSEYxWnRiNlZ2QSs0ZTY4dTdENXB2NUc0RGh3Z3dmWTBXQjA2?=
 =?utf-8?B?Q21TdlM1djFYNnlCeDVIdGNuNjYrQ3JKVWdiMW1PdXF1dDJTdVhpa3lka3ZG?=
 =?utf-8?B?cUZQOFAyTEd4aGxkQUJPRHRjM2g2LzhKR0JGaDAxNG1UbUFvc0lOUTJmbnFM?=
 =?utf-8?B?RlcrcS83VWppYXJ6bkJybGdrVEJnSmZRRmtma0pRL0pPMzc1OXF5czB4aTky?=
 =?utf-8?B?a3BFS1RBTlRETFl5RnVQOUxGZmplbC9mTC9zY1cwQmxQbmhycWdFbWwwQ2JH?=
 =?utf-8?B?bjh5cnI4RE5Zdml0bWYzZGhkT3diZlhVV2lhVG93VTd4ZDBRQXoyNmJzTy9D?=
 =?utf-8?B?Z1JhYW00Wk5ub0ZkbkF4SG11amVjbEJrWG5DUzVpczE0V3NVZG9zZHJHTmhP?=
 =?utf-8?B?K0xEM0lOL0l3QXB5eXBRdXUrQVoybnRCVmhyc2hCVE4yblYvVUlkSFlQVTBj?=
 =?utf-8?B?eFlvdmhTWldMSktsdzBZVzBJWWJjZTFSUzdCVU1Lb3pTVjBmUXJiMml2Wjhh?=
 =?utf-8?B?eUJkTnpPK0JTTExWbjQzQndDZ2lpUU9xb09TRCtKSEZ5S2x0M0JFdVVMZ29I?=
 =?utf-8?B?Y0I3TEk3STFubTdRNFFrSUszem4ycHZjMEw2bHBVSUExU3dhVVYzQXBDS2FH?=
 =?utf-8?B?eWluQ205WmlIOUt0MWRKQUYvLzVUSmp4YVBPWWV1dFN6TDVnWTlMT1dTK1VC?=
 =?utf-8?B?OGRLS1pzVjA2anI3NFIzY0hpWU9SOFNjMWFpWWVOdnNXcURvM0cyZ1FJaHdB?=
 =?utf-8?B?aDh6NEZ5OUlvOEV2ZFdvbTFkRGFaSnBYYWhYZzlyZmxtRU9wcFZMTHFrV2tz?=
 =?utf-8?B?MktzRUM4dExyVDNDcVBBaWs0a0tzMk4wUUdtT3B4N0w2d3FzNU9IU0tjdmd0?=
 =?utf-8?B?TXVSRUZraU1SeStWZ2Z0RUZTTldqbU1qamQ3YXlIU0w4QktNcjNSeFMrYktm?=
 =?utf-8?B?S1J1VlVwT3hpZFpOY2ZsMGhza2tTeVdRcnl3Q3YvOEppcDVRLzlVZE1KQmg5?=
 =?utf-8?B?cTdSekRPNVhkTmlJWk5zcGhyWkxiblhZZVgwQUw3WUNjWWtwdGlTUnV5TU8r?=
 =?utf-8?B?QjJ1a1FOM0NBM2NrZXpJdHBBUk9wQW9TVFJyLzd2VEx5RXNSaFcxWW5KdHZK?=
 =?utf-8?B?YkVJUXdHMTVvN1VvS2daa0I5eVVBOHVKS21WV1VSdzdHOERrN2RndFl3NXVq?=
 =?utf-8?B?SURzQW84UVEwQmlIRXQ2MHN4bUxmUEhHM0xtbzU2THFJZFNGUzdTdmJjYXJK?=
 =?utf-8?B?UzV2a2RGWW1rSHZIdTU1M2RkK2NUK3VlYjRxSEZxMUE5M3RnMXRXVjFPLzBU?=
 =?utf-8?B?K0Jwc3QvSW81aTcrOC9ZcGVVdXZzN1BOZERvMWprT0h3eThPTm0vV3ZidUJC?=
 =?utf-8?B?dllaUEpacVlvMXY0S280bzRtV204Q1FQKzdJaGNDSDVMMXNmTnJXZVZpN1oy?=
 =?utf-8?B?ZFBZU0dVNHBlSzhCNHBmV1JVS1ZzeXNsTUFxVnFId0xmSlcrMmVyV1Z0UGR2?=
 =?utf-8?B?U0t2OEpLaVFES1d2RDBNQVp5M2lsWSt5bWtrQStnSGt6aHpKclRkZExRN0hu?=
 =?utf-8?Q?+RfVzY8J28wppEDowV270Uv8i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e40393-1e8d-45ce-a768-08db675f85a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 14:00:16.6742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuPtbQRqgorjH48CkBmiSdtM/O7qLvJB919EQfYiEnkvuVsgOYHwnFhKOE8I34M9NsMnRZr2MMli3dp/4DwSDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8946

On 07.06.2023 15:46, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/domain.c
> +++ b/xen/arch/x86/hvm/domain.c
> @@ -266,8 +266,8 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
>  
>      if ( v->arch.hvm.guest_cr[4] & ~hvm_cr4_guest_valid_bits(d) )
>      {
> -        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx\n",
> -                v->arch.hvm.guest_cr[4]);
> +        gprintk(XENLOG_ERR, "Bad CR4 value: %#016lx (valid: %016lx)\n",
> +                v->arch.hvm.guest_cr[4], hvm_cr4_guest_valid_bits(d));
>          return -EINVAL;
>      }
>  
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1018,8 +1018,8 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
>  
>      if ( ctxt.cr4 & ~hvm_cr4_guest_valid_bits(d) )
>      {
> -        printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#" PRIx64 "\n",
> -               d->domain_id, ctxt.cr4);
> +        printk(XENLOG_G_ERR "HVM%d restore: bad CR4 %#016lx (valid: %016lx)\n",

I'm not convinced printing a lot of leading zeros is really useful here.
However, if you switch to that model, then all uses of the # modifier
need to go away (in the earlier instance it would be nice if you also
fixed the pre-existing issue then).

Jan

