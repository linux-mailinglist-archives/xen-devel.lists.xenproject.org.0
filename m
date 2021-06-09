Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21083A1543
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 15:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139336.257687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxer-0005mw-B0; Wed, 09 Jun 2021 12:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139336.257687; Wed, 09 Jun 2021 12:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqxer-0005ks-7h; Wed, 09 Jun 2021 12:50:09 +0000
Received: by outflank-mailman (input) for mailman id 139336;
 Wed, 09 Jun 2021 12:50:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YCjx=LD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqxep-0005Fv-Kx
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 12:50:07 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da256d4e-4ed9-4b65-86e2-55f1972ac695;
 Wed, 09 Jun 2021 12:50:04 +0000 (UTC)
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
X-Inumbo-ID: da256d4e-4ed9-4b65-86e2-55f1972ac695
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623243003;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SeKYIAeEx046XORKXKP0uvH2+V2+OhK5AJ0CFkDfCbM=;
  b=bAK5HNa5LQWuiMb/+5bGN2FyOwup6TAlI4C/MqpNCJ9ZHWW18We/kEJE
   MSGB9tzCSFtYckAFd/oKQPXB2OP3wgrKeXZS81TQuHWRzp0Xbg6bdjppY
   /Z6VfoeeUZDLtJwyl3qOrCZkQONjokTFm7BLoejA0ihzXA0wn118uGDsn
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0XHOScb0XYmIJHriv/JRoH32Sbi7sdt+IaCoAOMIZhnDzWrn0anKiRdad7fPMZTMcz1dr0n79T
 iagHxniTxBJcZ0BSipth8QRFbP3XiYOV38iwqChf9WvHvzsglpLaqKwxFce8zn6cS1BqoEoA95
 CUUpyyUkdvDf5T3E6C97LQw+nmOMjITy2UTeqnqqgW2X0YODSP5BU1to/lpYtINdw0xlj9LMV8
 6QmgVK1/CdbKIKcSZ1MGvkTd4FTs+hrFlYMxcpxZ4TkNBF9m3jSxw6Np+TZ5iRcSJ/qKACKt4h
 6UY=
X-SBRS: 5.1
X-MesageID: 45806671
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wIk6+qFqngcUvD2YpLqFDJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HlBEDyewKjyXcT2/hvAV7CZnibhILMFuBfBOTZskbd8kHFh4hgPO
 JbAtVD4b7LfCpHZKTBkXGF+r8bqbHtms3Y5pa9vgNQpENRGsZdBm9Ce3Wm+yZNNXB77PQCZf
 +hD4Z81kCdkSN9VLXKOpBJZZmMm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTij9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZgA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69MdkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/j5iuLMlGfhsRLEkjQVo+M9qJlOi1GlnKp
 gsMCjk3ocTTbvABEqp5lWGqbeXLwEO9hTveDlOhiXa6UkMoJjVp3FojPD3pU1wgq7VfaM0rd
 gsAp4Y442mcfVmJJ6VJN1xDfdfWVa9Di4lDgqpUB/a/fY8SgPwQtjMke8I2N0=
X-IronPort-AV: E=Sophos;i="5.83,260,1616472000"; 
   d="scan'208";a="45806671"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXhmOqTYndHQHKc+SBaHD6GKsWFM+UpFVgLV6hmknrDkU5lKEytm26T90CUe3n7W5jsjMTuy7YsP0YWrxuJUpAUOb3q99c96p9jmR4kEmWjy+b0TsfHz34cRWGFtka9IBwFWaN7mQgZT3ge4mHaB5jjC6zRjSv600v75CI3Jxrp7y9pzTRekAizJF5DbL9fPh1UUGbLx+ez6KxHNvmGf83UdYwnbSRhD9BjxnKmo/xCwbV6a9JMQYIuBZgkSckkd67ZxO8grNEu1wGiVLPAMxt5lXMqMzJVDoh+mDx4Yj2qq1c/iY6hq+Fq1ArxUTr30stmj0LVsyfyOqAKWACSo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeKYIAeEx046XORKXKP0uvH2+V2+OhK5AJ0CFkDfCbM=;
 b=lTBuUccAF6KZ1Tggz4Rf1HlaPZobfDY9Y0bY6QnlnTBmHDLDE02RE6IaLtuZ1ERCPNdU+Esol1BRiKGSkb2GnTvZH7KD2Bd7Wcte1UGVGBwXbML10+t/0F3zP2SpxMs2c6ugnSeGOjtAs2ZGaQF2N+lAtyChwLxIfHOXwxS5VfDd6kOKV5zRFu4NC4kC5FnsCAIIfuyNp6+MbV744dRmzfxMGo00W/riHm8HP9dOZRfPb8dTD4sxQRy9EzI63Q5zn1eaIeGSQnW0jpshvBPIyWY+pRF59LOMJ509b9MRM8B455zaSk6Wt3UdNAijEZR4K0Hw91g0LsO/Tf5pAc7nlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeKYIAeEx046XORKXKP0uvH2+V2+OhK5AJ0CFkDfCbM=;
 b=Jirq/49lxe1KpyMZ8lDz5V8oa61e/OsiJXD9NRHsmcZo6KXH9okeJuBeo3xhfqgzPB3/TRRYC/kKRO8fvPgG76rEeDFKhu1byiybA+dBUiKUmj0NpOiaPgxariCWKiBRVEuIOwIbnwPavBo3ibgoXjxHhheA2Q1p4FIdORRKncc=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <bdbd506a-e6fc-a560-1be7-7424f33d413e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: mark hypercall argument regs clobbering for intended
 fall-through
Message-ID: <b0675d1f-892a-fde5-133f-65462dd01677@citrix.com>
Date: Wed, 9 Jun 2021 13:49:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <bdbd506a-e6fc-a560-1be7-7424f33d413e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0317.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34cba056-9eb4-42f6-9733-08d92b451630
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB58375A5A3D22F1F2B1747FA6BA369@SJ0PR03MB5837.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymXOfCbB3mMDjuR+epdSNKT9JFfVMcGdCiAtkwo3GzzX6y2xDzpCNmIw4gjpSWCT7wECCGMO55gBv2MsmI4gdvS+8JjrfN70ue9Caq1/qfthjbhtODRXNpuuXEwBQbUA6kQ8nXKjUFfPBDUlwG/OJR/BF7EWWCrekHunS73iSh13xBYDJ9PuJPEE+XxEocJJC1TYsL36ORzRbRaD8j/fjrwgTTJra1EpVQJ2xRtaJDW1nFXv4/ouNA+BUDrjTkr/2RM7keoHjxQy2/pV6xp7Xi2HiOXtsG3NfIjidTadHZi3FFkDRPHmqIdidmxijQ+ZJ/qropgijTwv4DddX3QvMkL+JbcWTRcxzz67JSWYOWGr18I277ga6q44X+8eDTdf88qlWiId5hGb6kq39YGcBmG9NTSuU5M87qzZ46SjwjBff/qhGwdT463DaFY0f18YGbA4OxlGuAQNe/dog4tpCiHFy8lCvLYuGwIPS1ihHFSsMarkm0nlXYq5DYermkuzppmqRhQCJ1QWFzdfEjJkV3y3jj1awThOVxSfSx5UJInkK23IHxyd8YnSRFErG6HpX3H1B/MR2W5FThaWYDHXkpSGnT17mq1YrVKDDqiIA6tyqJ6XBgfjkdrMQ+R2a+/6qxg5pyJltugSlY3EpUc8iOTqq1xC+xv5i1IpC1PryXbsYUfTVkLmOu36zmXXoTaf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(366004)(346002)(39850400004)(107886003)(4744005)(54906003)(110136005)(8676002)(8936002)(5660300002)(316002)(16576012)(83380400001)(478600001)(6666004)(186003)(26005)(16526019)(86362001)(6486002)(2906002)(31696002)(31686004)(38100700002)(66946007)(66476007)(4326008)(66556008)(53546011)(36756003)(2616005)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGtSS1lKc0ZmSHhIUk1CL1duemowUSsyRkdVM2hyQy9TY1VSOW9rcFFjMFI1?=
 =?utf-8?B?UEZnSmpmdjRwN3JjZlhGYjJxTEtvZzl5SzJieW9WcUpLSGNzL3U2Vm93WUFK?=
 =?utf-8?B?VnBqUHJCbnFwRXZBRjhWcjFGb0lobGlBTlU2djZxeVMvaG5BNXVqaHJ6dEJ1?=
 =?utf-8?B?djlNbzJ3c05PT1pwTUtyNkhKdUVlZ01QN2tweGtsbXJLVGlhZWhjOU0yNFRU?=
 =?utf-8?B?R2RBY1N4bDUrVG1YblJ1WDBMTG1vb2ZGTnFUN0h1WTJDbE5qZHVSMy9uUnha?=
 =?utf-8?B?aFBzQ2ZxazJUSkdCcDFTTExXTUhVOElIZnc0d1g3MDNSTXhxTVJWTlN1MVUr?=
 =?utf-8?B?VkxJSzEzRWRzeVBtZTN4bThoeDB3RXJHbU85djVBVE9PUFpXcVRGMHVmY0lC?=
 =?utf-8?B?QzErTDVnKzVaNTd4OVQ1UHl3MkFtS2FJZ0VCUS9zUEtxNU51b2RvSzJjMHNZ?=
 =?utf-8?B?c2JKa0lUUXR3KzJPNTRhR3N5MjJFc3JPclBMOVdQVkpROUd5OG9JaCtCSFpw?=
 =?utf-8?B?elNDKzdBUVhLb1NoMHNEWEE2SmpQa2dRUExoanV0R0VlWGhkS1ZPTTdlMmxi?=
 =?utf-8?B?bEtETHJmTUdiWkUvMGNLQmZOWXlOL08rcmVrS2h1bnMrOU9Qazc3QlFCZjFu?=
 =?utf-8?B?aitFcVExSXprcGZrekthLzR5ajN5UisycWM3dlY1MzRhb2RUWWJLM0JxL0JJ?=
 =?utf-8?B?clpaTld5aGNIUDJ5aWt2eHdJZG5Fa21FSDBWL3dyVlZMZHkwemFaYm9wYU1V?=
 =?utf-8?B?eDFEUytHa1lrWjVDYmU1YjFCQ2piVlUrS2FWcnJlSUFJc1dVa0hNdEdtSGVT?=
 =?utf-8?B?TEt2V1NQWmIybXNnbGluQmFNZUZuZ1lqckFPVjJveU8zUzZTVjc4cGVDVXV4?=
 =?utf-8?B?dGJqY2V5TlVTOGl2YjFacjh1NDF0KzhweXJWSmlXbkQwM0dNcEplcVBIanV2?=
 =?utf-8?B?V1hIUXdDbW9oVWpyK0NsbVpwME1KWC9EWllMRGN3WCtaQTgrNVZya2VPQlJZ?=
 =?utf-8?B?dVJaN1Z2Y0VPS0F1Vy9GWTFkUVU2MEhWcDMzVnBkdjFrN3ZqaFZEd2hub1RK?=
 =?utf-8?B?TEY4VE95Y3lER2hvMnpVcVdyTkU2bmZPRko1d3BBNUwrUFRKTTZUdVhWR3d3?=
 =?utf-8?B?YWpGblI0bWxHT1pCc2tFRE5EZUNidE11UUpZdk9IcVgvSWdxeWJwMzZpUlpU?=
 =?utf-8?B?QUFSR2JFUmZYMHV2RlY2R1oyb1FUYTEzQkdiZElyemtzNmQ3Tkt0TnByRUh3?=
 =?utf-8?B?eU1iNS92akNUdkp5UlVpeUtpQ1A0NEh5cnJEZS9pVVpGMkpaaXNMaVM3bERE?=
 =?utf-8?B?Qlo2T3JBbVFZMkpLd3hTSVJkU0t5SmZwdHFMRXhOWkdEd1NTRzc4Qy9pZmRR?=
 =?utf-8?B?MVhUZGpZWncwNVBCcXZKUU1wV2E3SmlsS3NiNDdQNGRFdENTUjkxUHNBZFdX?=
 =?utf-8?B?VVZMRktIQ0NYSU5aT0lVUnlFbEVEM2hrYjg0YVhOdzVCd0t2Ui9ISURZSWVI?=
 =?utf-8?B?VDkyb0VjcjVWb0pQS3VoaFBIZExONkVVZFltcW5qS1ljZGFuNVU4aGV3TzA4?=
 =?utf-8?B?VFRTSmtQRHl4TEh3dGp4cXFCT2Nrdm16ek5BVU1QSWtXWTRJY2kvN3BITVlU?=
 =?utf-8?B?WEJ3Q3FsRkFDZWpFTHZHNnpidHFFQjhsMlp4cWE1S1JsVUdGVFRiWlpJN0xx?=
 =?utf-8?B?K3cxMzFtME5IYi9reExzUzNVUlRyUDU1MzcvZzR0N1AzSnRXR1NpS0M3WEU4?=
 =?utf-8?Q?nc9tAC2rE2b/TCAHWqQwxfr48bpAnkQPiaUU9t+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cba056-9eb4-42f6-9733-08d92b451630
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 12:49:57.6105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+gDAID2/nvMXT30yaq42YtWCYg6XEZrzQJouSdRfoGfPS1pUYWlpaG9OwBEleGOffEnMe7UUKEo9IQPmJbrDFDW63FFIhhTWyp1BnBjDhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5837
X-OriginatorOrg: citrix.com

On 09/06/2021 11:34, Jan Beulich wrote:
> The CIDs below are all for the PV side of things, but also take care of
> the HVM side.
>
> Coverity-ID: 1485896, 1485901, 1485906, 1485910, 1485911,=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Let's see whether Coverity actually understands the (relatively) new
> pseudo-keyword.

This is exceedingly disappointing.=C2=A0 Coverity used to have the only
sensible rule for not causing spurious fallthrough warnings, but this
has apparently regressed.

Coverity works on the AST, so ought to be after GCC has interpreted
__attribute__((__fallthrough__)) if applicable.

However, I doubt it will work in the fallback case, because #define
fallthrough looks dubious.=C2=A0 To trigger the older logic, the /*
fallthrough */ comment needs to be the final thing before the next case
label, and it isn't with the added semicolon.

Given that this pseudo-keyword is restricted to the SMMU driver for now,
we don't actually know if Coverity likes it or not.

~Andrew


