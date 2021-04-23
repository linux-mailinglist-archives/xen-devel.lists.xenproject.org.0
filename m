Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0783694A0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 16:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116430.222234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwm8-0004Mx-JX; Fri, 23 Apr 2021 14:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116430.222234; Fri, 23 Apr 2021 14:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwm8-0004MX-Fs; Fri, 23 Apr 2021 14:27:20 +0000
Received: by outflank-mailman (input) for mailman id 116430;
 Fri, 23 Apr 2021 14:27:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZwm6-0004MR-UE
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 14:27:18 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8724357a-57e2-4a4a-b64a-0b31322b9930;
 Fri, 23 Apr 2021 14:27:17 +0000 (UTC)
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
X-Inumbo-ID: 8724357a-57e2-4a4a-b64a-0b31322b9930
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619188037;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WKGouTe5x4abmWqrRqQbiUFGNeiI8Z7tkWZN41Hyi1w=;
  b=H7vt4h6tVMW7vmxTfm69ZbQ4ZbdAxHMCKEto7J4xw6ZXr/Td3/hhygnX
   /Dn9uFSfmm36E7SVEoO6eD+qrOThp4kpC7cLzkztYMedlCEVDwD2fna7M
   DFKP+XipvlfuxyEYovAtL22U661M1uMI2VhUbbMPbGZM1IqCV8YV4OfoU
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2vrnpsA43HwWzB7E+eiz899IccBTAiOjYgb9p3R7wNXFA1XgVbEF3uPPjDpzi6e7XiWv7Yql45
 QAetlavORbszwAeFTzdDfRNhlr4d72/QEjAyzgfAE/ijY2b9LRxkGUjxUz4V9itH02lYK5dzKe
 uNEP8JqytTEG20EIIrlVQyICVNikE2o/87RVU31DS22NRvP3CmpfYwoLdI3szQ/wGDLSCmF06u
 I+xT88sUxIv0pNj+NiPMlKoyodCBYFLn5R02paXDt22ZG+B3Ibc6FbfW/cQd/K2lBvBMFVq8KQ
 xFU=
X-SBRS: 5.2
X-MesageID: 42275637
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Qe9De6McmJsQbsBcTxP155DYdL4zR+YMi2QD/1xtSBBTb8yTn9
 2vmvNe7hPvlDMNQhgb9OyoEqPoexPh3LRy5pQcOqrnYRn+tAKTXeVfxKbB4xmlIS3x8eZByb
 xtGpIVNPTcBUV35PyU3CCWCNAlqePozImNpcPzi0hgVhtrbaYI1XYdNi++HldtTAdLQboVfa
 DshfZvnDardXQJYsnTPBBsM9TrnNHXiIngJScPGh9P0mKzpAm14733GQXw5GZ9bxpzx94ZkF
 TtokjCyYiI99q6zRLd0GG71eUqpPLRjuFtKebJpswcKjDHghulaoJ7S9S5zUwIidDq0nkGup
 3hpAohItRS5hrqDx6IiCqo4SbM+nIP7GLv0lCRi3eLm72GeBsKT/BvqKgcVzmx0TtGgPhMlJ
 hl8kjcir9sSTTHpyj578igbWAQqmOE5UAMvMRWs2ZSSuIlGdlshL1axmx5OrEaEhn37Yg2ed
 Medv301bJtfVSWY2uxhBgX/PWcGnA6HhKxSkMfoMCi0z9PgHBjz0cDrfZv5ks9yA==
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42275637"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhgwOIZgh6nUp/BEnjU/a/SM8kXdUpHydVAInSC3nohbb+GITrsiRj792VgDulKwtZoV2ahsQZ+onvv+Jk9Eg9N6mtQWTE9bI6ok1p7SUKQMY1xstZkMX3i89PtCvzg13Nh8fgN5PqkncueyvR4JEcQxowp6qUijhSaD7BPYA7KuvmkzS3xCy92PorWLf8dXL07zikwBJBZhH0+WEvNpkcQtukCIkr3TsmQnliywz+6hTOZABTaMPPI3iMOZOQxTc1tfZrX6+4RuAc7r8pbkCB9gVLuxliNAr/Tlz+S3EGg/CZTjzRTInvrxKujJ009V3UdUcBdWwHbP0lpSWm2A0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPfYXvC9KnrUd2ufBg/2YkRNJLaVKSAarwCjwPpLm7U=;
 b=GJ/Ks4OmfouO72VMy81VmPjgKzBxUGVh+REMhDTaYCdC58VGzvGc/af0WajDT7dojUw1SnKkBHn2xmEeoZQAAWC+n0qfjjIvyuIBhDytuKYhFo70NSJtjj/M3RffJYzM3XN35QF8DtiQzEjBAT44lh6oaRxwBG0X9NtvZk916famcFOLg3etjabrAZDAAs64ZkCFEQfnL3J3vKLP9uoMAYo/eUW9EbJrgnCp8ru5bZw0ZF4/+w9KkB/xX6FUeo/BlNAOneDpS/dCgCCO4M/lpIGIkzMjvXS1yWzJLNfJysrA0gtsr5cFI8FEQYuzWs1IbsagUwTD0ddjvdh4HKd8Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPfYXvC9KnrUd2ufBg/2YkRNJLaVKSAarwCjwPpLm7U=;
 b=tIujobWiesTzrHhCFqeKM1uR2VbwXNxRb+wNtzjWUkFu6R/o8EYAeY0SafFHgALs2FHwsTqMJ/1utl+Yvcy/jaIDFiZ3TU5Vc39kLho7Zpkn2G40wq8Ua2QxMvorjcZX+RQZg8fk/O8Io5OE4cn2gkrMPxCUEL2me6qmpuDSCU8=
Date: Fri, 23 Apr 2021 16:27:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] x86/EFI: keep debug info in xen.efi
Message-ID: <YILZPbRRR26nYRWt@Air-de-Roger>
References: <89e97459-28fd-704f-d424-88afa3a2a4a5@suse.com>
 <084ef874-3ef2-cb52-bc4b-3b9d78c826ae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <084ef874-3ef2-cb52-bc4b-3b9d78c826ae@suse.com>
X-ClientProxiedBy: MR2P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b9a7b8b-12d7-4b41-5218-08d90663e452
X-MS-TrafficTypeDiagnostic: DM4PR03MB5999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB5999E7D1A2CEE2C9B0B2FE018F459@DM4PR03MB5999.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLfEIMuNmyD1znD9Kwc8UVg5gvF7IsWvG6+P/CkXSLMQvbltt78de58UVJGmnwI9DBXbtkz2e4MiBOC3mNvCR1STaQKBEiQNtM6qKAOXpaV8FLL6ur5Omb04jveOOYWDTyiuSv8upEEHCBwLB3lVf5H1uRaTINpIJoz66bOatP2fDIPraBapcWdyBMBY2WJVdyzKs1MuJ4IBsR82cCVVbMsX6fWk6cmqLrromseb6ffVFJHKVG5phvIsaaidMvzvDYp2qOTsXV3HLvzWE44bKlMebGtH44D3OKM5ykC7UapY38jBjQhkjHwWgL4taZ74zW5Srel5DIkoGcogPbas/UC1mkZnj0eapV0td/nMGvm1Cey5ViD1lVsXvQEfoF8Cb6dGL1US+sS5w7EGVicg+dMpmM2mehKeYTkZ38q3nSkjTnb/Q7vR09Siw0FYkGssdvwJW8iFUm1WjTVQIaGUJfEqngK02Sur29amS63jx1UKd3P81iup94xnQBry+ReFUoZwT8ftkverwDD2QOaKDCZ8G7no/LjEGxWgsFcc6g6L5swK+su8XtJsVh4e+xQ9ECUMzTEfEVvFP7s6eFBEGo+Ry6Ihtq6S7Iw6pS1ixsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(186003)(38100700002)(316002)(9686003)(16526019)(6666004)(6496006)(6486002)(26005)(8676002)(5660300002)(54906003)(6916009)(8936002)(85182001)(66946007)(33716001)(478600001)(83380400001)(4326008)(86362001)(956004)(66476007)(2906002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U01vSXRGSGRxaHVDM0NRL0EvNDByWW1naExmczZkdmd5YldHNUQzSlFSTmxY?=
 =?utf-8?B?VldwNXhZQ20zNTlZNmtWZ1lWaTVSSFhzbUhHRzMwNE8wVTR5WTZ6cnM4NU9N?=
 =?utf-8?B?SHhkMm5DR2d2WS9oYmZPTkJPakt0YlhWNnlSQkh3WmZzTTdVaU9ET055MjF1?=
 =?utf-8?B?b1crdTVQV0xpeTNhdU92WmFQa1BISTA5NHB4OXNNUXNwL2ErWlpMTDVWNWdm?=
 =?utf-8?B?N0R1dVMrSlVWT3YxQTNjU00wa2tmZG13aWx4c3d1YXUweG9uanB2Z3BtS3lu?=
 =?utf-8?B?ck5ZdGM0VzU4V0hEZVJnZm52N0pLYWIxMC9XTTFlZ1RiMmdxeG9mVS8wa2Nw?=
 =?utf-8?B?SFZQMm9FcmRLYnNGdmk4ZFRuYkZZMEZjd0VOMkpzeHY0WGZhWDg5V1EreEFm?=
 =?utf-8?B?eE9lNERDSkV1SlBTdk1Oa0JuTy8zTUU1YWNKaUI3bVVDYmxETk1oUGZZQ0dU?=
 =?utf-8?B?M2F3eHhHVEMwNDlKSDBkcHJSR3JPWWMvQlNRdzJmTVhNM1ZKenN0Wlp1Yytk?=
 =?utf-8?B?N0hhSTZjajVyL3dFOW5zcUFPWTFKazl1RitFb0FPMVU5SlkvMlEwRjhnbVdM?=
 =?utf-8?B?blNUbFZjM0V5RjlqeTlkTmNZWU5Pd2ptUHlYaFBwckpvaVFhZGdnZ2lpejNw?=
 =?utf-8?B?b0czd3JTWU1oMmZKQVdEaGxUbWJGMVNmZTdnTm05a2NoQkhLeGJwZVFUOGRH?=
 =?utf-8?B?a3k1TkF5Q0ltVlZEZ0hZUkNlSHV6cHZtUUpMZGM3VUNpYzFZaGdTV3pmbnkx?=
 =?utf-8?B?SThuQnRtUzJqOWxaZlNPNnR0SlVybTh4WHZIK0xCdG5aUDhSd3k5MWMxVGJ2?=
 =?utf-8?B?Q21HNFNhTDZPdFRXcWhER3orNTZWMlhzTzM3YWZhUDVwK3NNUkhaTS9WaE52?=
 =?utf-8?B?blZUaXdUVWZ0d3h5TFVzL0xLM2JWNXdDUklGMWhRTDhZNFAzTUhJZTZ4S25Z?=
 =?utf-8?B?WE9uaWZjb3hNbzdVSGFtK2llbjliRDVWbnhOdDZxcm9EczNldGNSdzVXbGFC?=
 =?utf-8?B?cEJGUUg5UWt4YW8yUHIrWTUwWC90ZU82b0QzdlFaaTZibU5NOUJzWjJVUkZt?=
 =?utf-8?B?QUJJZ0VPRFprdStrQnI1OUt5NU4zZnlLZ085cVpDNEJiL0ttSyt5ZGh0UXZq?=
 =?utf-8?B?aHBJK0pmS1grV2tyZmg0UmxYRzFKempzbGJQKzQrdVo0eWNuVEN3NGxNb1pj?=
 =?utf-8?B?VnRNQ1A3NHhJMFZ2MXhkZVd1M2o4cWExQ1o1aGhieUFCQngxd1BkdXppSzhz?=
 =?utf-8?B?RUx5d3dOWVhkYXRpNzJTUjFKVWlCYkxrSTRpMHJJclJZaDlYRkRHbms0TGhI?=
 =?utf-8?B?dGhNbng2aEgrZVFjckFqZW1oM3FOVWhyWk13cGpBUzhYSUtvTkkxZEZSMHpk?=
 =?utf-8?B?TU1MMVV5SDErMExWOEN0QVYrcEJmNHpXU1BCRnFNTTk2QU8xSjRYV0pNSDZ2?=
 =?utf-8?B?cHFEWm9wR0wyelFyZGJzYVlRYndubW5JOEhnT3Q1NU1kcTI1dUQ2OHFma0Q4?=
 =?utf-8?B?cUtQRklnRmVvWmRNUkpjcEx2K1RlL055eHhLYUF3SHU4aytpZ2FMSEQ0cENH?=
 =?utf-8?B?alkwNDRqcGtKVk5kMTdoTkRvOFc0QzdOL2RNbmF0blQ2QXVKUFNFM0xSQTJ5?=
 =?utf-8?B?akE4UDI0OUVmYXhyM2NSSDdDaWNDcHJKQ2p2UXFOSEl0bS9STFQ5S01wNjEv?=
 =?utf-8?B?Tk9Db1dMN1gwemdDNmowY3c3TGgyRzFJa0d3TmhvMDNNNi81NFdSZzRXL01q?=
 =?utf-8?Q?rTT55cIucYGrSBy+Cb/gdXaxZQnkv/7sxifAwHV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9a7b8b-12d7-4b41-5218-08d90663e452
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 14:27:15.2880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwA9RozsAejvbl3ZXJ49HFfqKk7PDgR1lMeZaNfy8kEyrUUYjQrmN9LKos3gH4P4APvEsamITIhe7tZhE+Mkmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5999
X-OriginatorOrg: citrix.com

On Fri, Apr 23, 2021 at 01:04:10PM +0200, Jan Beulich wrote:
> ... provided the linker supports it (which it does as of commit
> 2dfa8341e079 ["ELF DWARF in PE output"]).
> 
> Without mentioning debugging sections, the linker would put them at
> VA 0, thus making them unreachable by 32-bit (relative or absolute)
> relocations. If relocations were resolvable (or absent) the resulting
> binary would have invalid section RVAs (0 - __image_base__, truncated to
> 32 bits). Mentioning debugging sections without specifying an address
> will result in the linker putting them all on the same RVA. A loader is,
> afaict, free to reject loading such an image, as sections shouldn't
> overlap. (The above describes GNU ld 2.36 behavior, which - if deemed
> buggy - could change.)
> 
> Make sure our up-to-16Mb padding doesn't unnecessarily further extend
> the image.
> 
> Take the opportunity and also switch to using $(call ld-option,...).
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

