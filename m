Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965A1580B97
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 08:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375050.607326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGE0U-0006TD-Su; Tue, 26 Jul 2022 06:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375050.607326; Tue, 26 Jul 2022 06:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGE0U-0006Q9-QH; Tue, 26 Jul 2022 06:25:26 +0000
Received: by outflank-mailman (input) for mailman id 375050;
 Tue, 26 Jul 2022 06:25:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGE0S-0006Q3-TQ
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 06:25:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70044.outbound.protection.outlook.com [40.107.7.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb09e6cf-0cab-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 08:25:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3571.eurprd04.prod.outlook.com (2603:10a6:208:18::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 06:25:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Tue, 26 Jul 2022
 06:25:21 +0000
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
X-Inumbo-ID: bb09e6cf-0cab-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/yiY6AuHBT2ZR3w9TfEP0wQ5lmHkEEzzzVv5Zl/NbIiWi6zS2nFwmSiKhbaKMfCuz19Ylv49CNHNMXb5dq3ctYBF1OAVwoMQPmbmgnNr/CmbJQQaJnirVLEv55Z8+BQXPTAgkrmHdKAxT5fWuIBYSDqwsMi3xaP6o2fTmel12TxoTOX7xBCPuKQDw9JBclaVp/fHdD/24nU38qjDdyWBG+z6xMU+Gz7ajcw2EMpywWMY4B77GrOsxneZJBPqo9pnFV8nE5LS2rSefx2pT7rnFXMUC+e9ztoV+00fq/B0IeuCtgoKCnlOl9u35xbQcR3Qq3tJm9rmwVW7G9klNFGIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tqwn1E7U4qBKmhrFy4yNBjSmu/J3YiePt13DAU78sy0=;
 b=FhOth/Vqm4RprwuJzKSdgv3/tSN3cwSqzOb7iGERFcYq0PNkWhHOTlsnycaX7WtbFEDpH75/QDMzM34lW3AgkNACIJgj+btngm0NAzLPleJlvweJKi5RtnCXC/+JxaS9PblzbP4lRRZA44sLQSq9hLk9jHpzjESccpHVTlU300cMwJY7zSs3T0LC59DnsWqPLcHJTAukaz5CxuHCzy2hvnNiooH10nUObFnwydjJeW+cwH89Aur4sH7aQryNLMhIQX8YWCx36QFjzea4SdWTY5MoPG1GjFevfbg6Hxi3Ch4ATEdNIPR7DbjykiYdDqTKu7xOdLvRiLcp/xSHaeSIiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tqwn1E7U4qBKmhrFy4yNBjSmu/J3YiePt13DAU78sy0=;
 b=v37Rj2Y1vWaE0d/Aui0YNy1r1DRSEUW12UigvFD45D9PoWdTuzoFcM9nq4AzmmIJEFCEIABNEem86suapypVopNlYiLgmH6/Ph8OoHQr9mpofMCGb8WjbRiv2IqC62mgErhlFGVeG6DVt4j7yC3PwFkImLIkfMMnayDp0UspZkUxEORFQoSNtjxr+Ttzp0BxW6D7gsv7vB927FGxWw/ubnW8iUK9dEvOQyDWD4hrOOsLusQmwjwziWsMNMR7C7/EpG8kLkdGTym4PYzIRnLzqQfpmv+ZqXPLKBZ5qBd0lme1s0F4eLlDgQNAD6ZNMuKUDNKAIdSihqrUiwvFpoBMpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bbdcb776-804e-a27e-5849-b3664e2208ec@suse.com>
Date: Tue, 26 Jul 2022 08:25:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] livepatch: create-diff-object: Check that the section
 has a secsym
Content-Language: en-US
To: Sarah Newman <sarah.newman@computer.org>
Cc: konrad.wilk@oracle.com, ross.lagerwall@citrix.com,
 xen-devel@lists.xenproject.org
References: <d45c75a2-81ae-7061-6f75-ed8378fc6d16@suse.com>
 <20220725171302.25910-1-sarah.newman@computer.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220725171302.25910-1-sarah.newman@computer.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 077dbfe5-a907-4a3a-2cdc-08da6ecf9dd4
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3571:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iDBJziNuV4HfUyo/jLPIHp11gYUTZU75GuvBcmVtYSRvv/WxKQBeJE0dBYmTnsnFjW5sb8WKxcuZKTna0V7inKaYW+sMtDIln0QwinLL3OiIedYPwqfK9s00vO5qwbK8aQOc7mO70m7qtzJEQjkUv8NFiEOX5HFXAukvXBR2U8g125xTz7SzqW2ZCWedgfVhjPN+bnuSkci6dlV4ovQO4BPKocC7287tmquu7d5uU9XYIRTbQJdZ0Xx8Mm850lXm8IfROICR70P3HmKPQv3BdIftGCZnS8kKuxu++eb9BSISS3AW2TDbnbDcS2UBmksLYM5VguIBBa2l3iBal0ANCfCwE6oRFMQDZvYtudzgtjmx9GPpo3ji56CLgOoH8ienfaXqM8J4sIzJBXWTrKvW+T5Qq7PseXx+BtGTUJaeF8WW8LMitWzm0/xsAmM4hMwpD3gdEdNVJqGLtcFlgRaJZQc2PTZqAHrZpiaEebHSte3tCE6G2++f4mqAz/zzWuL3EK2vz98wKI1/LNBkElVJh5J5PTJN5oheuYjCc66Ug0oi7mrCHCmQFWhMzVS5SbN90CMAwQPPvAeDzaAVCecozzfAJYtAvzteWeKo4mdIyifmwctqMvHi6MxDsQSKXwpmtMUjptFy73QZH+WwVm0boUErCAXQpNKEKJQKst+tEmubwZ2+qTW2GfHKGz7RFGFzC3ikbqprAFTQ2SjEOU1SvTR2ZQrCrf3vxHFMtj7QUHZEJezi9/rq97mbunJk7xbr0gTYD+01o9xkpXVmtAUk3hWprTxeI8VCnr+N76VdYNX1aEO3KDHE5gDTVP+f8hoUdbiMuasc70A0VdEW2jidcaJFdvOFUp02xMGmC4bTLpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(346002)(376002)(136003)(396003)(5660300002)(6486002)(478600001)(2616005)(26005)(8936002)(966005)(6512007)(6506007)(53546011)(4744005)(2906002)(41300700001)(186003)(38100700002)(31686004)(66946007)(31696002)(36756003)(4326008)(6916009)(316002)(86362001)(66556008)(8676002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1pPM1prbW16L3ZWbG9GUkZ5V08ydjM3SVFCa2x1MC9yTnBTTkp3ZUhEMWk5?=
 =?utf-8?B?WHZxMmhwK0ZKbVkzU0VmZlR1eCswWEF0aWlLanBYdjA4TVE2ekFBRFViS1dv?=
 =?utf-8?B?angwbzdHanBSRmIzWjUveDBJNkpYT3B2T0RsclhMdUVIQklaSTJYOGtQWXk1?=
 =?utf-8?B?MGpDQXc2b2NrbE1HeXlhU2t1aDYyLzJnR1hML3Z1SFNMeVAxZmNrTTkxMFdS?=
 =?utf-8?B?TXNCVDN2RGQvMzJNL29jVmZuTk9IangzSmUveGg3aEZybGY4WVNSWko1cjlo?=
 =?utf-8?B?UG1MY3oxWkdaL3NhY3VRZkVTazR0ZDBrb3lDZWtpVEpCVzg3Rzdjd04xbVY0?=
 =?utf-8?B?T3o2MGNZL1QwQ2l3Y0VhS2VMODkxUERmSFdPa2JudmZqczN3NzhYM21WV1BL?=
 =?utf-8?B?cXhpeFpzeCtrYnNMTUFhZlloaVFMTHpaVXYxZlJmWlcrZ0JwbnNoVnZqMkhX?=
 =?utf-8?B?N2F5L1ROYmxXc1lnTmdRY01uRTE0R05HZmZlMWkyMSs3TlhIK2E5Uzh4SlRs?=
 =?utf-8?B?aE41RkxpQ2RBc1FKcUo1eUoxQjRabkRmdm9pckt5QmVyZjRja3lJR3d6Qk1Z?=
 =?utf-8?B?Q05Ha2lzSVJpMUYvZUoxZnhKYnVaWnhEeEEycUdhaVJCaU93SXQ5R2hGNnc3?=
 =?utf-8?B?SjRpemswRTR4b0krckd1UHdLZDB2SEdtZlNhQzFndUJtb3JNdHZJMXlHOGJp?=
 =?utf-8?B?K3BWUDI3YU1pSUJnYlRheklNWXRDS2pYSURDemVvQlhOSzJsSFp0TnozM0No?=
 =?utf-8?B?aWlIUHNFM0xmaEtLenVrMDNqUTVORGJhMHpCc016Mk8rczFPbTJ3NXYvVWpr?=
 =?utf-8?B?OUgwdFd1THl6RmhabCtjS3EvNkVVZEUxbmViMEZxTEh2RVRPbXZPNm9vN0VG?=
 =?utf-8?B?M05PaVJkUThnZ3M1clptalNtQVdSaXA2N0tYMDIxc1N1Zi9WNStpZ2FlU2h2?=
 =?utf-8?B?TDBhU1BPdEg3Y2s0MVE0WngzZnRvclhWRVQzMjBBZFdEWUlUamZUeStqbXBC?=
 =?utf-8?B?QkQyN1haeEVucVMzWXE1aGFIS1NvUDZtWmJSVi84clZMbW5RTDc5ZVJxSTQ4?=
 =?utf-8?B?MWJWLzd1UkIrMmZiZkY4S080UWFod1ZDcXhoZHI0MVRscVNocU15OXgwT3B5?=
 =?utf-8?B?c0xwTjhNNlVKU2hQQmZNcUNieXpxZlBNYTAyY0wySXBxdXJBYVJlbFc5Yytw?=
 =?utf-8?B?dUR4c1EwVEIzZjU0aWlKbHNYVE9uV3lZZkhjdTYzNS9PQ2FjNnNPN3NkblQx?=
 =?utf-8?B?VmF0eDFmOHI1M3NUOGN2UmVBQlI3TTRmKzd6OUl2amFpRDFBRzlhUzJiWWVW?=
 =?utf-8?B?NjBwdWdkbzk0cTVocDZJU3JYNXl1dGdnT2FpL0xPVmhoc1hwdGQxZlhjMnlR?=
 =?utf-8?B?cHdsamw5SFdhOGxMdW5UWG9pNXFZUGg3NVd5S0J6SzV1S1Mrbm02REU1aTU5?=
 =?utf-8?B?TWgvRE0wZUp1YjJnRUhOZFRGM3VMRWVVcGVwWlQrTGZkOXZVZVFmRndpYldS?=
 =?utf-8?B?cnB0M09jbFFnbmt4NjdDV3Z6aFJQeEJyR3lnSHpURXJrUWJpVnFseVBxdjlu?=
 =?utf-8?B?bUlaeHFZVFoyRFAvM3FGczNCUXpoNHQ0bGdnK2xCVjZpRFhUWHFRZEdxV2Ru?=
 =?utf-8?B?eTJTNW9ralJ5QTF4YjArNFpZK25LU0lnd0t3bTZYOG42NVVNdGlib2FlZlFl?=
 =?utf-8?B?VWlwSTBIaldBM0dtWURiOVJwdGpCV0hzN1ZoS1dUdm5HdVQwQm9oYkwrSmdZ?=
 =?utf-8?B?bXhqL2lvNmRhWkptSTQzVWF4aU9Fd2dlb1cweUdpTHNuVFlGZnZadGpFVlF0?=
 =?utf-8?B?bUl6L296eEttemtWZktEeCtVMzBiaktTazh5TE5pdmYxV0laOFBjNEtpTGlK?=
 =?utf-8?B?cUVCT1BtZUN3UDV1eDZ4SFMxS2xwcXA3Y0RhRFZMSXEwZmpQNXB2Q25XV1Vj?=
 =?utf-8?B?bk0rbUxtejJRSmZHdHk2MXYxbjJSVmdxa3R0Ny84VkNhdEhBa0dXOE5aaTBO?=
 =?utf-8?B?TEhvTXNkMm4wZVBHNGVwR2trRExZb0ZFQmc0anhsa1drRHBWSlNkTy9MVU1C?=
 =?utf-8?B?VUhWb0MwOFlnaW8rZHJKVGN2OVN4WHJmTisyakJxdnI1ME45L1Z4Y1FKZWls?=
 =?utf-8?Q?5fESxKmq3v6/Q0Ai0zQt6pHyT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077dbfe5-a907-4a3a-2cdc-08da6ecf9dd4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 06:25:21.2966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ywl7dxyg6Zv4WVSyMhFOa2/1qXMLPnbb2KcFHDHcmOeE1eyyqB1C6q6fTFhdPjdtrK9GogT0dkHDB8KcLdq7TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3571

On 25.07.2022 19:13, Sarah Newman wrote:
> A STT_SECTION symbol is not needed if if it is not used as a relocation
> target. Therefore, a section, in this case a debug section, may not have
> a secsym associated with it.
> 
> Signed-off-by: Bill Wendling <morbo@google.com>

Hmm - this wasn't here before. Does this then suggest the patch also
wants to be marked From: Bill?

> Origin: https://github.com/dynup/kpatch.git ba3defa06073
> Signed-off-by: Sarah Newman <sarah.newman@computer.org>
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Sigh. I had given R-b on v1 as well. Actually I had meant to commit this
yesterday (with all adjustments made), but as it turns out committers
can't commit to that tree. So it'll be up to Ross or Konrad to actually
take care of this.

Jan

