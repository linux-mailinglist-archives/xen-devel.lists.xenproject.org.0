Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 399CB6E597A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 08:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522589.812085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poewp-0003dt-Hi; Tue, 18 Apr 2023 06:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522589.812085; Tue, 18 Apr 2023 06:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poewp-0003ak-E0; Tue, 18 Apr 2023 06:36:15 +0000
Received: by outflank-mailman (input) for mailman id 522589;
 Tue, 18 Apr 2023 06:36:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTWx=AJ=citrix.com=prvs=4659928b3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poewo-0003ae-8d
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 06:36:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d4a9452-ddb3-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 08:36:09 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 02:36:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY1PR03MB7285.namprd03.prod.outlook.com (2603:10b6:a03:529::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 06:36:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 06:36:04 +0000
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
X-Inumbo-ID: 4d4a9452-ddb3-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681799770;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jeN5R5IJXCD1wndUshTfAot4E7Y8F76ddWvdj6WVdwk=;
  b=MhNtM4kscE9/VGec2Vdj66qCACDv1CZmii64bvSg48zdPjuGvAap5Plz
   1HW7JsWzIgXJytPfs/U6gjp96MA9KHiAxi6mRveQuZ2cuN7zP2bJ1r6EM
   CD7fjXo8zF5r+c070OcOvDJYb9YMUdlcCzTZhZyn9M/M57QIxOozrLw6Z
   Y=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 106315822
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Z4E9fK6yXMvGZgV/sr+C2wxRtIzGchMFZxGqfqrLsTDasY5as4F+v
 mtJXTqBOquNYGXzed10OYqxphlSuZDcmIJnSAQ9pSg8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPawS7AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 M4qOhsLdE6/n+vm4YmZRuc1jcEbM5y+VG8fkikIITDxK98DGMqGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkUoojumF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKSubhq64w2jV/wEQaLRcWVl6cqsWeyVfvS+MFF
 3MfoysX+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbRRgsbSTTW+W/5+OrC21IikTJikJYipsZQEC6dPyrZozih/KR9BLH6u8j9mzEjb1q
 xiDqCklm7wSl4gFzay99lHcqy2grd7CSQtdzg7QWGSi7A9weo++T4Ot4Fnfq/1HKe6xSV2Mv
 2MFmo6d8foJBpGOkwSCRewMGPei4PPtGC3RhxtjEocs8xyp+mW/ZsZA7TdmPkBrP80YPzjzb
 yfuVRh54ZZSOD6ga/9xaofoUcAyl/G+RJLiS+zeacdIbt5pbgib8SpyZEmWmWfwjEwrlqJ5M
 pCeGSqxMUsn5W1c5GLeb48gPXUDn0jSGUu7qUjH8ima
IronPort-HdrOrdr: A9a23:imE71auECa9taiE3Ts9p5U6p7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-Talos-CUID: 9a23:+Jb+vmAFMr0t/bn6ExBVxlw/HNp7TmXUnFbrAUO2UG1scKLAHA==
X-Talos-MUID: 9a23:SLtSJwSjDrwm7M+cRXTloTtiN8JP6JiJS1lcgaRch/aPbC1JbmI=
X-IronPort-AV: E=Sophos;i="5.99,206,1677560400"; 
   d="scan'208";a="106315822"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OODWZ4HOGd9FOgJ+v0o/eoUJhlSVH0te2FgnWZevUTJi0abxvclv52LAVmgif1zpIBhAuVsFvUVYLVcfZiLfYltIv6hN+GTK/TQplgzz0m3FfMLILqqljlGswHgM1UfjjYPEmbOV5W3BX8lDiiSo8imiCs+mEJOepDclKQ0j0zRgE3A2nqhioovdmNJ84BtlKaDwZt6dJ813AQBydDmk5Dh5sDWWTsPT7hkPsjpkQ2VClp3Uicvi1mlwRJOJuKBHx54o34/bm1jrWJ61Jb6LsCp2n2AF4bcQ3Cj/IPKSNT0kpmQH1xq53+FjhqurRE15ZRHYIK8sLwLdaPPFjQiwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pl9fNOVUoXt7aab3EwC3zBNIsAVcmpyPKFit//ZfZU=;
 b=DMFILtwAnhQlwBwusCHBGj5Srw/WO5BBHz6o61PWowClrbEP2N4aWRF0h7CK5FwJDro8eyh7LVQac9xF45l8PI/ldSy8nD70Xpyj/MfBZeaymzOzphura2qH5NGfSS2eeSpTrhHV+C3hTl68kR67J1haYwcISohjx1sHHoFH7dykOckVp8qzISxyyohguAkf3ld5OY/DIaGQyjqxB0eilz75GEWROfGA4d67MshaGS1YC02z32NLcnjHzwBT1bAAWKXzrSZjPfk5d2yTunrGIv6nDtyVJD0ekL1HGwhEDK6mbfx5Xw9PzojqrhrjYPdR+l23xOdTXNqqk90O7CMBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pl9fNOVUoXt7aab3EwC3zBNIsAVcmpyPKFit//ZfZU=;
 b=hoqyH4g3tgbM+J3Twi8DDnpV2uFNMoFZqCfobRUli1mAWFEO0alvSryL4IPstgVjzhaqmWqDk+/wC6BkCX3tA3DO5aIGRJrjaWBvJhut9RTSDdF3YU8NyGPVA18nuI58u6sDopuD8h7pz7FtzrPq85vFFfbEhaeP7NZX0tZ2sks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e6df88d7-25de-4ae9-2187-9cb9afc624e2@citrix.com>
Date: Tue, 18 Apr 2023 07:35:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/2] deal with GOT stuff for RISC-V
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1678970065.git.oleksii.kurochko@gmail.com>
 <69e031eb-6172-1ab0-5ffa-4650f69e83a7@citrix.com>
 <fdc599f9-da0f-815c-1850-3120c5f69b73@suse.com>
In-Reply-To: <fdc599f9-da0f-815c-1850-3120c5f69b73@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY1PR03MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: b521721f-29ea-4f83-5430-08db3fd72ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ea8DPUzSaooyk6iEBklNZG4eQUDFKxddOU5oqSTkQx7Y+LvVDj59Y4e4IRUpajdwMM9eM/1F3y/s7ct8fH+dv1MXOLPP/PSCXW3xyWs1tlvDDuib4VSUfIFq7SLhVkCM8633BAfj9IXE3P2PJJRdyocXy/ZfZDDeWxnICJeQQIK1UIINNeh0pTu7WjPvphuIHaDd315z6xxQHpQiovZrpBlODlsOYchtaTRFM6FSQkRrFmRj5bOCITk2JWvEBtjRf7siKk/mubrur5Q6Fru1KBOC1Glcmq7yHhpIivMEjbYA+sK9EoDx1+gCAHjfDtWxjFHuQYcvPwqdNxL+Vq71jGL4YPqF8PvbNHppuuYitLWs+sA4C6mzIgSvE88yCHzPHU1nmAHYFTCtV3+LuMZSxGRqaTYK8kOK4+89sv3OwWalu3dtkfhC6kpfL8V1RzlUTgSJezGWQvfDd8ap+1M6dfDsegBjBes5g6S0oFVUSMlapVZuXKn+1FfKrmYdSvqtjrlDxdsvUbF+SIPflJWoKL+nGboATC7fLYg02Fuq1Gsa3/7lWiyWtIxdlTDXKMLWnkTNZtoLN+eTN9DfX+MxpwtJzGQPAkR+Lq5dU9bx/J2i7WoC/SqDW34j697K63OvL4W34GEbRIFTizFh7a7xng==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(5660300002)(2616005)(31696002)(86362001)(186003)(26005)(6512007)(53546011)(82960400001)(6506007)(38100700002)(8936002)(8676002)(54906003)(478600001)(6486002)(6666004)(41300700001)(316002)(36756003)(66556008)(66476007)(4326008)(66946007)(31686004)(6916009)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGJ0SW9DOWNlekJNQTFLTm14TzJwM1VqaEMremRuWWxURktFN2dpenlJVzh5?=
 =?utf-8?B?czlHeXMra2Z4QkRqZTBLRzkrZWs3eGl4aXpXOVNZVlg0bzZQUEtiQS9rVnpu?=
 =?utf-8?B?SVVSb3dMdlYvTEFpSGduT0dWdFBBMFZMQVd5anB0NUFadFQ3N0Rkc2NRY2gz?=
 =?utf-8?B?SEJyRnpiYWV6ekVlQkE3YkZtazRsbFhIWmF5dUlxc2VLMldnSFV3TlIvM0hj?=
 =?utf-8?B?MnNwNWFFUTRGRTgxMXcybUJXcW8rQUpody9BbjB3UXZ1M21sMC9oOVF0NXQ5?=
 =?utf-8?B?ME9FYVZORjdCT2VnRE52WktINEc2VWMvTFpGSVFrQ3IyaFNEOHAzRTUwMHI5?=
 =?utf-8?B?WmhVRmZ6ei9QMGVsRjN3UXZqQnJkUENzVVJRYXkrd3pxQ1EyUnhDcnBNTXVx?=
 =?utf-8?B?TG9Lek9tdXBEdmFhZzBUNlQrSFZIWXA0cE5NS3J2TGhsSmtSV1FwUU5jeXh0?=
 =?utf-8?B?K0RCYmliMUNrY2FMSE05dlBqaW9JUzdkZllzeHpjYWErWmRlOHNHeHc5Z1dC?=
 =?utf-8?B?NUg0c2VhOVNpWnFmWkZueVdMT2VWdk0zNTQyeGx2YmJBSzBaNkdFWGh0Qzhn?=
 =?utf-8?B?M2dNaThKSEtHM0xKR0xkV3kydUFENm42OEo2YlZzb0lJOEloejVvK2Y5R3BO?=
 =?utf-8?B?K0pTOVF3MmNsNHFrS1l1YitPV3JZdi9ZMk5VMWYwV1RUZHpoVTluR0wxNFNs?=
 =?utf-8?B?YTlDbnp5L0prZDJhOXczbmdmVDkraEZRNk8vRms5ZHRPY3JGMWJLQW8zc0xq?=
 =?utf-8?B?ZkViYk9ncklCRlZxdytaeDBzRDhsNFRsWXAvaml3dUlKVWIxMUpoOG5Yd3g5?=
 =?utf-8?B?QlpXQTFQSlhYOHZleE1CYnBidmtuNktGRlFPYlhvT0s0Y1lHVG1Va1p6VU9i?=
 =?utf-8?B?bDB0NlJ1UGVkbUw2TjVvZGlUTHNrMG1VNGJIOTZ4ZTVpS2NnaDVuNjJkTEpS?=
 =?utf-8?B?SkpmNmEwOERLV0tmTm9XWjZoQ2tDaEJoVlpvQ3U2bkl6NjJpTm5QcHd0UzE5?=
 =?utf-8?B?VFdJYzVLRU43elp0YVZIZFg4WXhVZVhhU2FIczJUUlJBandRZXVRbVB6TEZ0?=
 =?utf-8?B?RGFEYjdEb25pTjl2cWE3S2VkUC8xcnhKZE9zR004RUZPSjNXTWRMTlVLS3VX?=
 =?utf-8?B?VDZxT2wweXQ3bkQvalN5SVpEdDV5M3hnR2V3NU5BaFBlTUZvVVppTzh3WWVI?=
 =?utf-8?B?L0gwZUlENm9XeE9sbzlMcS9FNkNMTFUxNFR2UVJSVnJxK1pWYnZYcFVsWHNK?=
 =?utf-8?B?VHFtUUkvQ0cxZFVEczM1SmJGL1Y1djd6enVsdVVuek9xN2VwS3RTN0hwQ2FE?=
 =?utf-8?B?UGFRZUpiSk9nTXhrNUkzOUJRWXRRMnZyR2J6SFNDRWgvclJBMWNaRkxqYUN5?=
 =?utf-8?B?VWVET1BSVGZiQS9CcUlnbkdTS1JxMDhkQ3VqVy8vQU9UQVYrYlM1Y1RrM1Yv?=
 =?utf-8?B?ZXNQaGEwWjVwK2NFaWFPek9BY1BObWN0UU9OSlBqRUZNNUZFL1h6bHFDaDg2?=
 =?utf-8?B?WjhBMkQwNmZnelZmajl2a3A1N3AvYzBROUVybFJmKzFTb2hoeFNJam5kZTBt?=
 =?utf-8?B?L3ViS216R1EvZm42QUZEL2E0K0hyVnhaRXNybktKclZWS084VUlDNXc0b1Jm?=
 =?utf-8?B?SEwvUnl5dXNvUzJzcWN2K3ptNFF0N293TEVPL2JIbll5R213cldBUWRvTVJ2?=
 =?utf-8?B?T0NESUlxY3ArS0xHTmZPaXUzR2F0YWlKTndFQTRzdGtyRHdWbnVRMFNrU0lD?=
 =?utf-8?B?Tno2WHN4UVAyY2dHMlovMzFvRjJJWDd1ZEV4VENvbm1aZFppbE1PelJyV25q?=
 =?utf-8?B?R0dtakNpU1VGV21DZ1JleEtoTGwzQWJMWU1lR1hWMlByTTZVN0c2VENNTzJL?=
 =?utf-8?B?bkxHcUQrcTN5WHhIdFg4M0d5YUpUaHFjb1JaOXg0TGVKSjBRb0pEcFhBTXpv?=
 =?utf-8?B?UHRTMi96ck9IMzFEbTZIc1dRZjkyOWtCcXpvWkJWSHNvUHQ4YzVwT3BxVzVF?=
 =?utf-8?B?UVJ2WW5xY2VVNHJoQy93VDZ4elNybmU5UlZDZW5aUEMxc3pjbUZCL2xYSnN3?=
 =?utf-8?B?Sk1QYXcrNTVzVUhTeDRVRlU0c0VSRFZPTWE5Z0QvQnRwWVZBQUxRVWdGSnJw?=
 =?utf-8?B?OStlTC85NWhXL2RiOGJEY29XMVZSOWZOaGUwK2pVY3U3aUFybGNmUGVBNnZV?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SIIhLi+s2dDhRytYdtqvpYyxKjg/CSCpa6t1Mo+lWx5o1I1LrUEJMB3NInuzY3f9CIh2YOcoMl7DKmIzg9PNUKTYm81VyOtk8LxR7uwmD8N/qe59RAdnbILwp7Ro3qC8PF4dbMDOFMMWgIjd3bcBfTNDUzEjgHwFc2InfthEr2pdvhB4qhDKQ9+vK/mHtGEASuXecsj0UIJPsudSoHhnUDxVkO9pK7L4/y9vxD7aGxAw6OJfOtlX8sOJrzzgMtfqEaEtfBTar/17FYFgR6waE893VKWysQfMCcj5WtB0XSkUjlRrde7Hi4yXV5eGMV38ybrGKeuEQ1gZ+loVyT8u3Qsk3GhSjBLhQY+QhIJhuaOTsnAIrNxp5X3qf9u7ixJnzAx8AZdTg9GUi3h7m9htAcGsgJI0eCIu3DBJ9SG9ZmtS2a4DNsCseiSdR+8+Sz7j04OjQtN7Llb4CuGs0vxaaHFX4CZmfGh+TD2NitBdivjmD8h5SiLlu/3ZwsmUacgdfjoPiN0sgEPNcEKvxu5+9n+btF4yuCrWnkv7MMapYPmSsUDhu0MST68ALkCGP9oBWXa6YlKu1e1cDFaHV9expbMx+JIEqyEplUY5onPi89ViVI80jiKzOpUHKp/Dn7GvY6xS+npAm/Ykt05i8OMvt5fz2j3Hl29LdoaFVx7rGNQl7Yi2jnZu1F4R4IlhGy++iY56RgZoeNadeEx2ZSHelcY5lrW/BI06keD74JK7piAC7FsIP2wFZTFc4HPSErG/7ABTlbNN2LVFyB4kw8Vlf/8CccD/5ukQjxHtyxFem7ASZVTVagmvyKPHjV2ao+bCkto54WprjmnMX36R29i7t2xjURYWyonXY0bX5o30VF2AhljNItIB3+dm/gpf+mVNen+lR1+JZjyaFnrW/STAoffjM/Q4NP0c6HEwOe0i/LA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b521721f-29ea-4f83-5430-08db3fd72ed6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 06:36:04.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13rYrn/+Re1GKAYanHYzCVtMXuH63HQKQ82NiY8f5/bpyrzqZmRZQH2NiF9EXQI8NdBwksoGQNvcXSALEo7fkvrApunkTNSxOu1RS4Ywp7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7285

On 18/04/2023 7:30 am, Jan Beulich wrote:
> On 16.03.2023 14:59, Andrew Cooper wrote:
>> On 16/03/2023 1:22 pm, Oleksii Kurochko wrote:
>>> Oleksii Kurochko (2):
>>>   xen/riscv: add EMBEDDED_EXTRA_CFLAGS to CFLAGS
>>>   xen/riscv: add explicit check that .got{.plt} is empty
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I'm sorry, I failed to apply this ack while committing.

Oh well.  The important thing is that it's in now.

~Andrew

