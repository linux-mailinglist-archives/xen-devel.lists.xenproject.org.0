Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9887F322E50
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 17:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88873.167249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEaDF-0005Li-DU; Tue, 23 Feb 2021 16:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88873.167249; Tue, 23 Feb 2021 16:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEaDF-0005LJ-9q; Tue, 23 Feb 2021 16:07:01 +0000
Received: by outflank-mailman (input) for mailman id 88873;
 Tue, 23 Feb 2021 16:06:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ey4c=HZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEaDD-0005Kv-E3
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 16:06:59 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55cce69c-b148-4287-9480-06d76ddc19a5;
 Tue, 23 Feb 2021 16:06:58 +0000 (UTC)
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
X-Inumbo-ID: 55cce69c-b148-4287-9480-06d76ddc19a5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614096418;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1Jy9kfn1Rg/Q8aoBegPupCuZ0Rut8f+LX2PojXWt8Lg=;
  b=MgWdpszA0ISTv/50nKTyP6kCyocGQitMu/gfXvnRGanN+KCLtvX7qEtX
   KD3C2F9ygd8Vnw6QTPjKKzSplvzBeVu7sZqfc6mNn32KxgerRWWwXQopo
   dWuJTs3lZdAZ1kGsRaHR9pfcrXE+fxC62FLPJ93TCH3zjQ6Hs3x+btOVb
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZyQJvQ0pjDaBfo65i57ep1ONyjyVZxl8hN2LofPdP+13vudXYEF58KmD2w3U1EK8xRHnGUiBrm
 FOJIT2uNgHAk315mMuQ8ghXbBcMfH1UEmo+dcfZAwsclAXlWJXEFTH+zGePKS3GFXiQYkRtOSn
 GoU31gYEI5+MS5vuuDLp0TeHRPx2yyhYAl66Hnqo9ps+8bAS9Qv0RUvM84VCHKfmA3oqUmGg8W
 4gC2R+cTSC1/WkMgR7otq+U2/Ebp/OHQkCYJy+/AxC0cy9F1ax1XZyCSOX40HVONcm21hb+2sd
 Uac=
X-SBRS: None
X-MesageID: 39226058
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,200,1610427600"; 
   d="scan'208";a="39226058"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfNQPDgeLgNDk43/8Ml+edXiwbivpnds0R/aSeuUxVS3ggev/2ZyEBnguNL0GgXIoIRRU8/hL+jFgNI1oCV6ZTBE6sqACUEVVt4DYYqTrcLWThdS9s8D1hCgauiPAczWwywpkddFd1+8joNK1VC1U3Vx/IIqm0KimURZoWnxFstXDOlR8g0Vmn2HR7jF5nhQRiZSR2/jlzDeVG/kWRoBjuZof/oOTbZzup6l+lIZCleIM+nO7W27WsmhzN2EZzFGV3r1wudNHHuP/YnKFULN60LEZJ+5MLtHusus7CgDJHWEpxmMcm4yKKct3eGUncZbOkKYLSWXnQt6XE9k5D1E1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Jy9kfn1Rg/Q8aoBegPupCuZ0Rut8f+LX2PojXWt8Lg=;
 b=fAFrIeSEl1oZCHyjvwrNOWdFjNrtYYkDM6OuRBTXthf+rsCm9beywtYMPFeq07Gx/mt9RAFBK7dopT541vz+62jCj8c1EMwLU4pRq17TT95ZSfEfepxpqCYKh4vYa8EqlE0jcH3Ql+1Zh2ZaUo6ExGfWbpgYYNXMspgsxDKSDK0L4hguSus4VmSemcyAnEUca+DGq+vZt9NxGFIbgrj33JKXP7syCm/w3stMTQ67HLxwPutU7Lt1n7H14JdPHfWwwMSEmooaKKuKCsx7kQCueQsWgWdsfzTUrM733zjhuLwTt9AL37gYJh9nOOBOS0zz1ngR4VsQKkHjKW1+KLyiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Jy9kfn1Rg/Q8aoBegPupCuZ0Rut8f+LX2PojXWt8Lg=;
 b=nkM7czuOE0Adl23DDN27FEoqMi4nec5AtzJGn6lzGOeoqhgoilJRNi32bnUyVfQpe4P0kAy0aLkdFGhRDzMVwe59TRwHxiaeImoCIkIDf0QVge6fXe7tURQ4oFFez282tt3vk4wb7bjudnjznYqvE0gLksjtTJcBlnB42qlJKqI=
Subject: Re: [PATCH for-4.15] cirrus-ci: introduce some basic FreeBSD testing
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20210223155353.77191-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9a63c657-81be-9ddc-b822-64a790136ddf@citrix.com>
Date: Tue, 23 Feb 2021 16:06:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210223155353.77191-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0254.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7defa13-5e8d-407c-ad1a-08d8d81509b4
X-MS-TrafficTypeDiagnostic: BYAPR03MB4679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4679DFF41BDCE18FDFC35DF6BA809@BYAPR03MB4679.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qvEWxvAX97qROlT3qfW1Rxvmjg94mEURnKQoVaQolONy/YT0ZUcu2Uua7wbvG9dbIMbmm4O8Vi1aoS/usnY5MTizc03foiI77H7d45KzU0X5j3AgGBN8HuVZKynjcFQzYc0hncH2bBkdil1gVEua5wEA0v2t/Vr0KRY5oxl49EmXM4WfZ/KSr6pyJHQ72Ou1Tsoes3ia69y381BSYKG9N7xGMjjxVLDFKveU+Ld2+Swqf65zD6vWO/2bxCMfCIpHq5wQmpoASeU/qpEbRZk8rm7WA65Y8LRFE73OlncoO9mrf5j7HVhQ1GurMokevda71tuRON2IRpS3/ifewNBHuX2w8yHieK1aC7tWSRudE9ola+ctyH06nmkYoId82osF8wMHI+VSz5O4v/pTAjYcsKN1mWgTCPT3elRUKTofnBSMOpswwH3FrnJQKoHii9AujQlgfBzPsFFSP2G/5Wxex/XgqeXdFYvS2FrfvK3CSx0yWhZhg1MNS5jwmnMCu1T9n8zGumuRqFDZomeLsoWOK4UUywI30GVFIYl7rQXNtVgjE1agckqDMD2nMl8ZuIPv4h7EV5GF0IA970vcz+HNwRDu5zxVEvkKRdZo7kqVxDcVdUzCQk6xZzGF8oFFRDLY6Mh2+8xGnIZYrO3Av3RbHpezFBjOTh7f5XzAHHeUrIjNQEifueObofK1111QzrH3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(5660300002)(6486002)(31696002)(8676002)(66556008)(4326008)(31686004)(316002)(83380400001)(6666004)(53546011)(36756003)(966005)(8936002)(86362001)(26005)(478600001)(66946007)(16576012)(186003)(2616005)(956004)(54906003)(66476007)(2906002)(16526019)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0VrcmtFaDllUmxNOXVVdVVJdVJEcVpCNEtIMmJ6Qm91UW9tNkJvZ21jMG1M?=
 =?utf-8?B?RjZOZkEvNGd2cnE1MHRkaDFrRzN5NGw3bURXUTdTV2h1TnVabzU3YWc1NEd6?=
 =?utf-8?B?dDRpZnBkUnRhMUdrZzlpRFNjWEtlM1U1OWVNU2U3QmoxWWJSRzY5Z2hSc2pS?=
 =?utf-8?B?WHd5elNRcGt3dVJKdjI4cTJ2QWRoV3FYa3RtSEhTS3BBY0h0TlRDaUkyVGVV?=
 =?utf-8?B?TW9tVWxXTkthV2kzemFCQW9SaDNqcUVueFJ0UXBFUk5pczVMa3FRNTYyM3Bi?=
 =?utf-8?B?YlZsRkJndmRZQmlsTlVFaVhTVzNBTTdYT1BmNitjTytnbXo3K2oxalA2enFT?=
 =?utf-8?B?K3NpTXdqSGE0OGRxQ0VGVmZ3MTJJVUR4QUZBUllaZ0tlVExsNjRUdW41ZVZ0?=
 =?utf-8?B?dGNNYm1YQnM3V1pmcmpIcHBXb1p6VFNjL1dKMXY4UG41SjNwN0hheSsxdEZE?=
 =?utf-8?B?aklxbis3ZXFyWVhMYXEyS0VMVkpOWjY0NG5xTVJMeTRxMUZCYmlvVG1MZnlo?=
 =?utf-8?B?aGVvTWtYekovWE9ZaE1uaFlhSHgxSkJlY0tWTkltajNQUlBFYTd0NVhNQVdL?=
 =?utf-8?B?akxOQVU4aG1SU25Zb3BLWDZPSDlFNU05Uk5HWXNsRXBiMWwxcU9aNmJxMEhE?=
 =?utf-8?B?TTZZZXlXeFVXTk9zWTdrZDh2Z0VjREhuZXZjenhpOUljbDRsQ3NOS1ZPUlAz?=
 =?utf-8?B?NDZUcVE0Yk1lR1dYY21tT200S1Y2OGRGdm9GVW1xUUtoaGo5Q1pCeEZFQyt1?=
 =?utf-8?B?aDkyZGVrYmhQVGlLT2dUZjZvT1pPNUZ1cmJ2Ym9nTWJrdWo1R3ZkWk9kQlJI?=
 =?utf-8?B?NTlQUC9SaHJzbS85VG1DWmh5YXRhVjdOOHlUZGt6NTA5NUtzNGhjWFg0SFhq?=
 =?utf-8?B?b1NDMGtVdzNieEpwSXdDUUtDeFM4U1d6bDhmMDIxYVdSWDBRUFhJRXhvZkY2?=
 =?utf-8?B?MkZTMmtzMFk1WEdSQ1FtcVBsQTQ3aitDL1JpejgzbWx0Y0swZHBSNmNIM0ZE?=
 =?utf-8?B?YjM2S1k4VDlXWTBJaXhJdHYyMGg4ZGl5NUxwUTJIWlFmVlJGa2tYbDN2djBo?=
 =?utf-8?B?ZzVobmREZjhBMFBtSFA2V3A1K21iVy9iNTQzRC9vSy9aZ29HWlV0VXEwcjZu?=
 =?utf-8?B?L1RDdWdXMzJQNkRrQnU5c3B2SkdjMEdnVVhueEdTQm9rK0NIcTRNUzlvalk4?=
 =?utf-8?B?Z3JhYXVibnl0S1RLYUdEQWozRG9ndWZvcHpxR1ZJL2F6UG42VmwxV29Pb25Q?=
 =?utf-8?B?SXp0bTF4RFF6d1QwdXFBWkpYNFpnTExVNUdERjlUYVNGR010RXBYSUR4UFNX?=
 =?utf-8?B?OFV6c2YyZGRLbldsL0grSVdRKzcybXo3THVTVzV6TmUyd1BsenlCaXZVTG9K?=
 =?utf-8?B?cXFnZnZscGxrOFg1ZEIzTDE5bWEvTGxMNEM4UWMrcTJuQ3ZkN0lsMVl3bmRP?=
 =?utf-8?B?NUhsY3B1ZXdHQU5SeVpYUlNscHh0ZDNsWTc3ZmhVNnB2bG9rK2xnSGh2ZExz?=
 =?utf-8?B?RlZqVmJ1YzBNQ2FmNlo2ODJKMkpPOXNoUVcvY1lGc3VxSVdlNzl5OVRmOGtB?=
 =?utf-8?B?R0xGVWd3MnQzaURKVVBIWTN3dGJLQm1qSi9NU0YxZ2lrUUFpMHd2OThmaUdm?=
 =?utf-8?B?Qk5FQXNHTzE3dVJ4WkdHWGxBUXJWcVFoSVM5MWhkQnFDMW4vNmZYSGJMdk90?=
 =?utf-8?B?eDZUZU0yemdqT1R5OWhGVXJRTlp0by82cFZLNzdYZ2x4MFo2Qk1Gd0FtemUz?=
 =?utf-8?Q?4FwMliYuUhss4uOzVLTxQWuViFr6o8NqCy+garc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7defa13-5e8d-407c-ad1a-08d8d81509b4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 16:06:54.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0GpacDc+CENrACJ8ALSAwYdU3zW2C26Z+lu1uv5V94mFnbAzc4aT1zV0lQStUBq6RkX4Au3f9C+qzNLoUuNbqKzj7LSwH6e9hpksULPovo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4679
X-OriginatorOrg: citrix.com

On 23/02/2021 15:53, Roger Pau Monne wrote:
> Cirrus-CI supports FreeBSD natively, so introduce some build tests on
> FreeBSD.
>
> The Cirrus-CI requires a Github repository in order to trigger the
> tests.
>
> A sample run output can be seen at:
>
> https://github.com/royger/xen/runs/1962451343
>
> Note the FreeBSD 11 task fails to build QEMU and is not part of this
> patch.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Fantastic to get some FreeBSD CI available.

