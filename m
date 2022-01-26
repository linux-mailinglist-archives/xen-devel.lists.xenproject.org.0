Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8986449CED5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 16:46:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260983.451389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkUA-00046t-8B; Wed, 26 Jan 2022 15:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260983.451389; Wed, 26 Jan 2022 15:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCkUA-00043K-3i; Wed, 26 Jan 2022 15:45:26 +0000
Received: by outflank-mailman (input) for mailman id 260983;
 Wed, 26 Jan 2022 15:45:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8h68=SK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCkU8-00043E-GE
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 15:45:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7b12d78-7ebe-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 16:45:22 +0100 (CET)
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
X-Inumbo-ID: f7b12d78-7ebe-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643211922;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xQesOBLCSQbcJ09Thp+C/JGJ4jS8UaFtnzpieHptzyw=;
  b=Kj2NIhMoBUdnnquTTLIA5wiLQRmI34BQuWLJWvP9A6WUyCcH3xUXPJY4
   IKiJCO/6IbI51/ysNZQAfQHfwLgSna/zzXpp5eYj/6+op2KbhHLfDCLJa
   fQ1eCnaAXO+uaMNEyU+gE2EoVHSrxz8GYGjXOZux6eozNbyKMZUGK6Czj
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TYxtxBX139C8Vf1+o4QMWM+TU/Mj6ZUlISzy5gEPTa7H2nfXyO8h2iafvdRRsKN3MSBaCLvPtH
 gw+fVABsXLu4c5eYb8d2kQDwMJoo7OYMoZ/dmaPGFW+K57dULDPMX2vKlvX3CNqLYF29HEsXqe
 tZEJY6joAH/h15Vr0eyHqG9eSihSbNxhV7t1/lfS/pEkaYtUv8+undUIGKvhGrIR2oHu0cnRAN
 8HMB11DIZljnjiXdLSC0f8dFadUa8Vn39sSIVzbfeSAie/7S11nIyca9lFUR55Sq2Rve8Icaqw
 U8b+UVyjKHwpUsNNMY89V9BY
X-SBRS: 5.2
X-MesageID: 62728626
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zch/0aPcaC9fQVHvrR3vkcFynXyQoLVcMsEvi/4bfWQNrUp2hmAFy
 DcbWzuEb/+LYmryLdtzbY/n/E9QvpHSx4dhGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eg9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoy65xfFO2
 f5ziby5VyQ2P73il/sASSANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uQuoUIgm1u7ixINfnwa
 M4bSydoVkqeYTsMAkZHEMwzmfj90xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiT8hPglyRo
 G6A+m3jGwwbL/SW0z/D+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc8pWN
 kg86ico668o+ySDVcLhVhe1pHqFuB80WNdKFeA+rgaXxcL84QyUG2wFRT5pc8E9uYk9QjlC/
 mGOm9TlFDl+qoq/QHiW9qqXhT6qMC1TJmgHDQcGUA8E7t/LsIw1yBXVQb5e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT5mCdog29jab1bgcrxRrWTkyq8R5jXdvwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yP7JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiIP7KigbArLWdrGR2Cg2bKjggBd2B3yckC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+bFPSXIF+tZbQvRBgzc0E9iiF+Em
 zq4H5DSoyizrcWkOnWHmWLtBQ1iwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNy4/AJuyA8cXhS9rbEQEYAfzs1B+MNnH0UvqX8ZtFVXR3LY9nacco
 jhsU5joP8mjvRyeq21CNsGs9dI7HPlp7CrXVxeYjPEEV8cIbyTC+8P+fxup8y8LDyGtstA5r
 aHm3QTeKafvjSw4ZCoPQP7wnV63o1YHn+d+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPDWtZqtHst/AlFeQzvR44GpOHSI5WGk24JBDrqFJGiPSGPu9ay+T
 uxJ1PWgYuYflVNHvtMkQbZmxK4z/fX1oLpewlg2FXnHdQ3zWLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd8N7aNz/AZnDXW/M8ZGkSi6X8l5qeDXGVTIwKI1H5XIoxqPd532
 uwmosMXtVCy00J4LtacgylI3G2QNXhcAb4/v5QXDYK32AomzlZOPc7VBiPsuczdbtxNNg8hI
 yOOhbqEjLNZnxKQf302HHnL/OxcmZVR50wakA5cfwyEyojfm/s6/BxN6jBmHA1awyJO3/93J
 mU2ZVZ+Ir+D/mswicVON4x299qt2PFNFpTN9mY0
IronPort-HdrOrdr: A9a23:Fk+I8aCkrWZWXJTlHemF55DYdb4zR+YMi2TDgXoBMSC9Ffbo8/
 xG/c5rsCMd6l4qMk3I/OrsBEDuex/hHPJOjrX5Xo3SPjUO2lHJEGg41/qa/9SIIUSXndK1s5
 0PT0EUMqySMbEVt6fHCKbTKada/DEqmprY4ts3bh1WPGdXV50=
X-IronPort-AV: E=Sophos;i="5.88,318,1635220800"; 
   d="scan'208";a="62728626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZmaFBRbdWUbYyyYvxML7E83+8VoSftM3bWVaK1iBt4UC5PP72NdumKV9fLJtaWDRRz4nL6judIaPjfLa69KN/QHKd1G421169rfLtDjJCV3mp3+DQo8noty1xnbAuAYLhaWeeJrp1l2o/y1uJCgfsUaVV/XBSDRVN8Qq9jvcBE7zfNrnk11D9TwjeQSD9QeE6uKN7qX19SNYc9ekSnj1q5yDMKpiUfe1M+2WRaC//IvN/+wMXDfOtCDoQpT/Q0GKNY5w1XfUnW9kVNb4exHovORskZ2GFjXi/Jq8tduhld80YxQmOkbtcrsM+N5TmEW1iU5SP0Q/58WxtF3K95cJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzOx2XXdsPxuqJitDKtVyu6svMqQ7P5ryci3cfaR15M=;
 b=Ycv64D3PyjEhgDkcAXdGwXbagjgjvE2NdzdOncMaR8xe0f9GiEygU3tPsxWjx1keq1np9ckrOc4vfI18jnOmZjWBKJKWmIFJ1unG/TgW34+luZ6mqR7F13J7KtvslobTS6JBi7XMsQoNvevmBHLYlGRURMUmrckltsPDye1clekyTFi0ZW+AAK4mnubNf6BxkGesstqY/qqDGL8ZklsqNn3Cz2lIlnZhkh6qiQtdGtHA2n+le++e02zh3SInBLRiS588H4FCufSPmbHuSfDYS1ZBYDuNyGZiv7jgf/tbDyzfLibz/pggkKo4TShE4Y2zkmGigpBcpLUpdqDsFiryFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzOx2XXdsPxuqJitDKtVyu6svMqQ7P5ryci3cfaR15M=;
 b=MkSJirwSUTnuNP1Hav5cvF1Ca3H4HwsYPexdX6F1cZyaVjSqr4nd2yMZmEoK+IIzK2drqsx0xQmTWJQy7jKgoGjZYX4lVTHw8AnRmw52bzogz/qFBtkukL0mBrRg60qkA+3VPDFAYSRqitvJ70m2TSg9hHBYP5gTd/mZSiJ/UaQ=
Date: Wed, 26 Jan 2022 16:45:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Wei
 Liu" <wl@xen.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC] xen/pci: detect when BARs overlap RAM
Message-ID: <YfFshcEanUtXUlK3@Air-de-Roger>
References: <20220126122648.52275-1-roger.pau@citrix.com>
 <8537763d-2601-4092-f70f-1abbdd0a211f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8537763d-2601-4092-f70f-1abbdd0a211f@suse.com>
X-ClientProxiedBy: MRXP264CA0044.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1aba72f-b565-40e7-f035-08d9e0e2d85b
X-MS-TrafficTypeDiagnostic: SN6PR03MB3648:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3648B478D4451B6DA59221498F209@SN6PR03MB3648.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G4D+xzwjxqHUB1c9LymPphRUFBOpgALJbnWFRRsSlfReZ0NCkkuI7LdCkFi/ugugf21dFCrqG62XaIu/JSEUSyKC4uTfg6/K403mP7iXbVDmdGXHGix6WXbbSgIEBHUjJv96/7hckGVrHfFFw9zXnWpvKdaFP0BS+1Z9Z02o4e6mOPnz7OaccHHZTvT2AJtVsc9Rrk577FFBe9U9A9BHER3HhtPaK6pqhx8TmsphLE8QOAVSsEWcX6zEnfmx8U13ZjikskI5DtVpnFmht/6agRu+Scoy1wDVo9cJqIJzGlliqXPQXHMr3FKBtpHgSIZ7W7cnyMoIVwRdcUjwX2BNcoOd/ihrIdaL/ug3h7lerE3p94hsM6RGUZ04Oc6uGjLly09uNn1iggobdnNABIo44B3BWGG07Vw9jWjl5iJYfsifXp+oKRL6bvicwTIQ6S1ZkrVc4LrnQU9eE7XdEAZGGvtrBzFUMGIYlkj7NE41etWRNauayPzmP7UTiNjJ9f18M0x5h+DA3dS52ZBE+MXp0mkjyeFHE1pfNNs1d887XZIFpd2rRKVcmE+krnrmz/Va12x3qrzZiQmkVJR2E8eUq+XmXdr38OR4jTAX4isQof/9L4v10QrraVbV2/r2/L1CrgmGqrqRL429OOsMD2F3zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6916009)(9686003)(2906002)(26005)(66476007)(6666004)(83380400001)(38100700002)(6512007)(53546011)(8936002)(4326008)(508600001)(5660300002)(186003)(85182001)(8676002)(33716001)(86362001)(66556008)(54906003)(6486002)(66946007)(316002)(82960400001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0Y3clY1ZlpWa3NaSG4zUUxXblU0UEFicTJCL0hJVEI1bUlFdVdORU9yR1BJ?=
 =?utf-8?B?RXRzendGVW8xR1ZUek8vWWcrMTlWWTIrZTh5Z0FHSE1hR0ZTTW51TEpVMTBo?=
 =?utf-8?B?RHBBTDdyN3Y2eXVPNVpYVnVTY3NnV0lHQ0cxRjFtV0pPWEN2RCtzMVlHcENN?=
 =?utf-8?B?QXZXMmtvejFoUnNVYm1kM0JhQ2pBYXZwZ3R1ZEZoNjh6LzBIbHdQVTVLT3p4?=
 =?utf-8?B?eU1lQjQySkJvUkR5cXpzVEFlV0xYZGpkWlJMNlJWN0RReTFnWHRwZU43MmdI?=
 =?utf-8?B?SUpNN3oyRDZZKzJ3M2JFNHVSNUQvS1plc05lNXNQVjQ2YXZ4VHVHSVNmYzZ0?=
 =?utf-8?B?VjhrS0hUUWNqRERlbmJsOEdkR3FTZWw1UU9INHRjZ2pJUkFGNnRRdGd2M1BF?=
 =?utf-8?B?N1RReXNOdng4OWdKTENsQWZaMldsTGtNN0tHcXh5S2RqMldkUjN6MXMrYVBF?=
 =?utf-8?B?dnhpVTZURlFncWxYVi9IaVVpdG5FMlJzOHVPdzl4WGVoSW44OXI0Z0JydmdR?=
 =?utf-8?B?NFduRGdqN3gxVDl2Z0FselRRTkRNdnA0amprUE41QUxyVDJvTWZ2TTZwbWdM?=
 =?utf-8?B?SldRaWFqaFVONVBVd3FGOS9mVFd1elVxSy9XcXBMWnVaNzkxSE9COUpwVGJn?=
 =?utf-8?B?bkg2T0ZPR0doQlRSaC9VdWh5WHlSVW5iWG5JWUh1NjEveW5RbUtkVnRtMG83?=
 =?utf-8?B?ZlUzZEV0bVpnU2hGVzNuR2F1NmQ2a1c4WHNwK1pRbnNzRW0vTEtJYk1iQnps?=
 =?utf-8?B?R1g5RXJBNkhybDZPQ3lsSTlpd1VuS2g3Ti8vTEZKQ1VJQU1sbXdNM0Rkb3ZE?=
 =?utf-8?B?UXRZazUxSzBUSjlXeWlKOThmNUJobENSMkdaSHdSWUl3T0tFcnlFaXF5U1Rl?=
 =?utf-8?B?YmVvVGovaFhkeGJOTnJ2MU05eFRjdkZWcWVmTGkvQ0MvalJhUXQvdEUzb2pp?=
 =?utf-8?B?MkF5d09BSVlLRWJJenIvb3o3Nmt1OU54RFlZcW9DRmNSMDN6TGxQM3Q0VGdY?=
 =?utf-8?B?T0Y4d3VhTXliT1JkN3I1L3lweHdKZHJReFVtclJkMGlSeEtZOE1XZGtKcHNp?=
 =?utf-8?B?VlFMLzRJQmhFbVJhbzhrQmxSeHhJaDg4a2kwZlEzTUxXWWU2ODNEVFgzV1o3?=
 =?utf-8?B?ODBCU3VIbkM5b1k1Q21RWk0rdGM5WVRuSi9USlozQmlWb0F0NVdNZlJNVmlu?=
 =?utf-8?B?RmtqaXh1TGswYUxZUysvY0hpTUtwQXlMRVFFdVRkK3V6REtuem9SRmVGS3FV?=
 =?utf-8?B?VFpNc1duZ0RQUlp4bVkxdXNuRGpGNDFrbUVSMFpsenczL294MnZ0SERVbDBY?=
 =?utf-8?B?MGZJL3duak44YTMvYmtHMTU4SDFHL2hjcmZGN1N3TE5UUjVFZmlySzY5MUUy?=
 =?utf-8?B?Q3lVZGpoakJ3Q3p0TW9HTWxCTVlweHE2a3BFS3ZMN2xCUnlWblY2QlFjT2dp?=
 =?utf-8?B?NFhrSGxqamFnOWdRTkpsOVAzZzd4ZTJFRStWUGlUS1JOK01QclNnTkVWQnRU?=
 =?utf-8?B?SVlDZXBhOU1lZ2tteEdGNjZoV2IvQ05NMy9WYUk1ZmVlVzd1WkRXSjZQV01w?=
 =?utf-8?B?WnpjMHo0ZElFWitMdVhkSkpFT1J1YTY2VE5WUEY4b3Z5YkFqZmgzUjZkT05N?=
 =?utf-8?B?dDd5SEhLaU0rbHQ4Y2dYK3lENmFRalJwS212Vy9ZZGZpQjZGTmhqRGs2bGRk?=
 =?utf-8?B?WkVRcFBZQy9UOExtOTNUbndIckdlU2pncWJqWFNpT1VOQ2JDVzE0bzkwaURY?=
 =?utf-8?B?TXh6M1U5b2Vrc0l3WU90Vk5zS2hoZFlZOENzSVZxWnZHS0gxVkRVQkdJTW9x?=
 =?utf-8?B?ZG9MWlNoSStjeXJLVWtOeTJ5bzFUQ3ZrUGFLN1orMC9GRWQ4TUNsZ256ZDZQ?=
 =?utf-8?B?MTRWSDVta0R1ZEdPWEF0QzB0aHdobWxTQ0poWmdvZ2Exa0hjSmVBVHFXOHkr?=
 =?utf-8?B?U3RVWFVzWnl1NDlZVFVkZVdSYTJkLzVQQlJnVEo2WjJVNEJhZlJKeVNrTFBW?=
 =?utf-8?B?WGY5RlJaVVhYTnUyQmwzbGVWZUJGeXNoR0VHejZlNzc3cm1Gcy9WVm1mdVBh?=
 =?utf-8?B?VXB0eEdwaGEwM2R6V1RYVEpJNUVSNU01U2wvZVhFYXNFc3FiS241OE1mK1or?=
 =?utf-8?B?WjJub2hIKy9DVGsrQnBXRTV4TFZCVTRVbFFUSmV4bVJmYWJ6YnVKUVhQdmNn?=
 =?utf-8?Q?oFhlzkYKV5AJyV9vJ59NynI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1aba72f-b565-40e7-f035-08d9e0e2d85b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 15:45:14.8176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fzPxE5ePL7iZfqd7tq01wV0RUvI5JaJVmaAZszvYs0V7/ud+toNXDjp9rVnMu1TaRRwm1Ss6DSkpZZ6PO9JxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3648
X-OriginatorOrg: citrix.com

On Wed, Jan 26, 2022 at 03:08:28PM +0100, Jan Beulich wrote:
> On 26.01.2022 13:26, Roger Pau Monne wrote:
> > RFC because:
> >  - Not sure the best way to implement is_iomem_range on Arm. BARs can
> >    be quite big, so iterating over every possible page is not ideal.
> >  - is_iomem_page cannot be used for this purpose on x86, because all
> >    the low 1MB will return true due to belonging to dom_io.
> 
> I don't see an issue there - if you were to us it, you'd end up with
> the same scalability issue as you point out for Arm.
> 
> >  - VF BARs are not checked. Should we also check them and disable VF
> >    if overlaps in a followup patch?
> 
> Not sure about "followup patch", but once we support SR-IOV for PVH,
> that'll want checking, yes.
> 
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -479,6 +479,26 @@ unsigned int page_get_ram_type(mfn_t mfn)
> >      return type ?: RAM_TYPE_UNKNOWN;
> >  }
> >  
> > +bool is_iomem_range(uint64_t start, uint64_t size)
> 
> Might be nice to have this sit next it is_iomem_page(). And wouldn't
> at least "start" better be paddr_t?

(paddr_t, size_t) would be better, but AFAICT size_t can be an
unsigned long and on Arm32 that won't be suitable for holding a 64bit
BAR size.

> > +{
> > +    unsigned int i;
> > +
> > +    for ( i = 0; i < e820.nr_map; i++ )
> > +    {
> > +        struct e820entry *entry = &e820.map[i];
> 
> const?
> 
> > +        if ( entry->type != E820_RAM && entry->type != E820_ACPI &&
> > +             entry->type != E820_NVS )
> > +            continue;
> 
> I think UNUSABLE also needs checking for here. Even further, it might
> be best to reject any range overlapping an E820 entry, since colliding
> with a RESERVED one could mean an overlap with e.g. MMCFG space.

Hm, I've though about adding UNUSABLE and RESERVED (and should have
added a note about this), but that might be too restrictive.

> > @@ -267,11 +270,74 @@ static void check_pdev(const struct pci_dev *pdev)
> >          }
> >          break;
> >  
> > +    case PCI_HEADER_TYPE_NORMAL:
> > +        nbars = PCI_HEADER_NORMAL_NR_BARS;
> > +        rom_pos = PCI_ROM_ADDRESS;
> > +        break;
> > +
> >      case PCI_HEADER_TYPE_CARDBUS:
> >          /* TODO */
> >          break;
> >      }
> >  #undef PCI_STATUS_CHECK
> > +
> > +    /* Check if BARs overlap with RAM regions. */
> > +    val = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
> > +    if ( !(val & PCI_COMMAND_MEMORY) || pdev->ignore_bars )
> > +        return;
> > +
> > +    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val & ~PCI_COMMAND_MEMORY);
> > +    for ( i = 0; i < nbars; )
> > +    {
> > +        uint64_t addr, size;
> > +        unsigned int reg = PCI_BASE_ADDRESS_0 + i * 4;
> > +        int rc = 1;
> > +
> > +        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) !=
> > +             PCI_BASE_ADDRESS_SPACE_MEMORY )
> > +            goto next;
> > +
> > +        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
> > +                              (i == nbars - 1) ? PCI_BAR_LAST : 0);
> > +        if ( rc < 0 )
> > +            return;
> 
> This isn't very nice, but probably the best you can do. Might be worth
> a comment, though.
> 
> > +        if ( size && !is_iomem_range(addr, size) )
> > +        {
> > +            /*
> > +             * Return without enabling memory decoding if BAR overlaps with
> > +             * RAM region.
> > +             */
> > +            printk(XENLOG_WARNING
> > +                   "%pp: disabled: BAR%u [%" PRIx64 ", %" PRIx64
> > +                   ") overlaps with RAM\n",
> 
> Mentioning "RAM" in comment and log message is potentially misleading
> when considering what other types get also checked (irrespective of my
> earlier comment). (Ftaod I don't mind the title using "RAM".)

Would the message below be better?

"%pp disabled: BAR%u [%" PRIx64 ", %" PRIx64 ") overlap detected\n"

> > @@ -399,8 +465,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
> >              break;
> >      }
> >  
> > -    check_pdev(pdev);
> >      apply_quirks(pdev);
> > +    check_pdev(pdev);
> 
> I can't find the description say anything about this re-ordering. What's
> the deal here?

Should have mentioned: this is required so that ignore_bars is set
prior to calling check_pdev.

Thanks, Roger.

