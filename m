Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1073C6714
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 01:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154897.286073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m35WL-0001jk-Um; Mon, 12 Jul 2021 23:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154897.286073; Mon, 12 Jul 2021 23:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m35WL-0001hF-Rr; Mon, 12 Jul 2021 23:39:29 +0000
Received: by outflank-mailman (input) for mailman id 154897;
 Mon, 12 Jul 2021 23:39:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbkG=ME=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m35WK-0001h9-0U
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 23:39:28 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 864b2797-7ace-415c-825a-d1d7bfcaec71;
 Mon, 12 Jul 2021 23:39:25 +0000 (UTC)
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
X-Inumbo-ID: 864b2797-7ace-415c-825a-d1d7bfcaec71
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626133165;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pO8fkT3vopgEnIlBAh9Iq7UJnuaOFq5Rjcyjh7/BjEs=;
  b=Mj1rzrD47Zrh9s+CDmVE+k+gWRdLHr0YOhh6ozR7AC5EDN+S+kcfHEcH
   owzvCmN2A+9WUTnspt0CZy8m5cpD177Fwl2HzxNCXkgnmKMSGB/jzeydr
   GozOeYZXUq51mwtNZMmmO1ZW8u5ZgAa9ME/0ewAdvbUgqcVut89KMhods
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PBGlFF5phMbRjvvph/nD9WETrimkuo6e2K0kGE/+8Hy24G8ZEEeIlPj1denGVSlZPKXCSY5eud
 5/iZ+2liuixxFbuIB5ajQt02REQ/zFh1sMjmZcVUNSOxZ+vp1hipK9H43Gj8hfnn8h5GcQd66R
 m6wxk8/6dT4KMFFmevwJqroeQUmqELLN1BQIO3ss3+3NbetvLu6F07PckjqI0Z+eCjoIKc0V2w
 c622RRkZeLGXAtC2las08s8CpyTGEa+KbqYzeqhUdWDwz+1x9xO3PR9HwbcX+2BTG7n47+jHku
 Q2Q=
X-SBRS: 5.1
X-MesageID: 48172094
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AuU7KKMkQEUiNcBcTzT155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/OxoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyYygcZ79
 YbT0EcMqyBMbEZt7eC3ODQKb9Jq7PmgcPY99s2jU0dKT2CA5sQnjuRYTzrdHGeKjM2Z6bRWK
 Dsnfau8FGbCAoqh4mAdzQ4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kPEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 XxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKS/ZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS0NL7t0YvE7f2VYUh6LD2pChuYdM99WPBmc4a+d
 BVfYLhDK08SyLcU5ix1VMfs+BFXRwIb1+7qwY5y4qoOgNt7QREJn0jtYUid0c7hecAoqZ/lp
 P524RT5fpzp5wtHOhA7Nloe7rANoWKe2OUDF6v
X-IronPort-AV: E=Sophos;i="5.84,235,1620705600"; 
   d="scan'208";a="48172094"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xm75UGVNnSqrTOmdscdNuZnGFU5CLILrKu78w+PKWOUEl0/3XIAGM3okasWwhL1Swn18M+O96UTDsQg76Rm68xKGB9yJgijWR/uAAfGJKvHkUVq8YlUEj7WwIFA4T92r28r+iSWHq1COpRJzyUMFm0c/yvs+d67d95fMQ6SjBHyqPia+G2+3jheU9LNgFNwbE3XaZBRIkFZYUJOgIY9reTzX4WK5hAPXkwpw0GV9W+dUzjrlUM6KBv3e9Fqb+tgsz+7+A/4G3DWhfT4Plsr/phk5nM5JpOwJqDIKukJtV7EnZ4IcuLIWekWoAz1Kq+lycXK+HwZAlg4TVXOmf3HnRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgPcwIi4Fw0krICkUzQ1EJQMUmXCnim7ofrU9aZ3b0g=;
 b=dRtDPhk4UUQSREk5O5CAiPTK8mjC1I2hSyZF9UKGCjF+QLABkoBctuH7GVC1dFzDUl38UzpjUgPxUKx+eBNVl/oAHEPxZGoiByD4CwF3ZFWg7hFEfFFPMERLI4gng9VJv5yr48z5VK+jKRy9YUgm0au0AW3lgmOSEaZUwh534NMWD1pWVIb5Twcnwf9fXU2fbxW7sjkFIJTEXUK8kU9TDw3SX2ZoUbVfGidbATLL7acKxwSLBk6Beyu/EC69jc0XShktlphF4U50dJz2zTlk8dCLRfI7jL3S0oSB7ghRZU1OnW7uhuf4t7/5iVnPjCn+Gd/SG8aD1snOkmYZtB8/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgPcwIi4Fw0krICkUzQ1EJQMUmXCnim7ofrU9aZ3b0g=;
 b=bljuIuV7IO5ThCREZD78633fpXl5n/5ypo/7RAKQoTbpQ1Pla9GduxSlo8EIUVQHUdTFRjHRaept0mSCbHcZJdMGfoY9DMRCQUL81PuYTuFiwourjnR1LKtzH6bQEn3atP5BMexbPqCq6SpiQs/sYjt+gJwwy8Idp14/3z5J0rE=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-3-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 02/10] xsm: refactor xsm_ops handling
Message-ID: <1638ecbe-59a2-1ef1-f18e-dc63e1740168@citrix.com>
Date: Tue, 13 Jul 2021 00:39:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210712203233.20289-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0160.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c9dfeec-f93a-4032-1ca6-08d9458e466a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6239:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6239B278BEEB283128AC8D99BA159@SJ0PR03MB6239.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3PhMr9vfVdDo9CP1crDKV3m01Ck+TgVRoiTMbDV7vHOcqaRXNFKPVpXhgyNRihKm+7ZGrAdDtxiQSUFr3w2Kg26N3+qxla1xWxIK3COMwCSQjcgqJdMYaen9scWVRlECXjeTfR4EQz4qm1Fw7SR1olEJs9mLHTPlXOe7MdIBAvyn4H5hjEMtOGrczII89mSE3/kD0STqZXm0j0uEqVp0Lhzy2HKk2znLQF0rLplO55EWt7nvU/VCI2mLHiqnUodVv7DNWpZu1xFMo6o50Xcd5CYXWofua5BgecAk349+AIUJgbam1LKXK/Yy0qaBt+/CF3BQjHfc8bksD3NnDw1CnuPpuvXGuoPTP+kJPln3qxdkH5kjrLsvSYDlD7DKGjXLKltn1WkpFSoAfF0LhKx6TuALEbO9CWHGmMUS/JKlKjf9HbuCAx/OzcUdgmFf5JUb0mFAE9o29iLFSbKyn9cmJ8uByHMZLWeON3qycgy/njGmxdoJN1K2JyOf9sNmqby+LoEnlhft1wHz0sorlLJ9Yv3XVcbk4Mj2joOHyBqMJ7Ue6k1B4+AWYuWEdLpsKUCpqTzJJS2lB+O9VtnvGBGQuuVPBhKVV8NLH9vRH1VzsGW/jcG4RdEQ9VM7tBt2wzJ6BTKjpBNlUC7lsu0KyBpei1gsSm8U8rc6LUD7F4ODpFA6sJtHZBcKBKLJFbIXTXpsm5DDco+JHyFz69ZRlTnML+RtxKTI9M0VlvHf7cBCgVoHZYYTd4HrW3BXYRpKAlP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(316002)(38100700002)(16576012)(53546011)(478600001)(956004)(8936002)(6486002)(31696002)(66556008)(26005)(2906002)(2616005)(66476007)(8676002)(86362001)(6666004)(4326008)(66946007)(186003)(36756003)(31686004)(5660300002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3MxUzZhazJMQ2l6U2N0NjJmVzQyV3BlQ1VyS1NnZnl6S0orcHdiSWdRZHlE?=
 =?utf-8?B?Vms3S2RMRnFDOGhrNElRaFpXcFJDbG8xSkxjd1NXYUdaRTYrdUhvcnlLQVBZ?=
 =?utf-8?B?MVRHOXdjTUF2TzMzMHdpMTArbW9xSUp3OVZ0ckxoQm5SVnBpVllsS1RGU24v?=
 =?utf-8?B?cEZIUzdOenRDRWtueHdtRElVUjdpRXlzdjNiU0dBZFAwU3BFQUFzYkJROEZC?=
 =?utf-8?B?OGNRYi9RTEFrTHZtTWVlY1NiZzA4andjenM1V1B3T0h1TVpmVStmcGdBV3Fv?=
 =?utf-8?B?MXN2M2EySVdWTXM5Z0pHVlZoK3hMQStWSk9MWDN2Q0Q4U3YycXBmRFRLQUFp?=
 =?utf-8?B?RVhwNnRlcVo4M0ZyRmRMQlJEbDhxSXNrU2p4ck8vZ3Riam1BSnZjQXZjNWhN?=
 =?utf-8?B?Q1JuNm15cW5ZOThseWhyTVZvOU5UREwzZG5uVVVXakdzaGFMckcwR3cveXlv?=
 =?utf-8?B?K2dwNVpZSVM3MHRpTm1HK3JBRXN3ZUMrcHU1bEJJUGhCcytkN2ZxVm5OMkhU?=
 =?utf-8?B?dCtHa1JVd29DVXI4WWgzbWZzSkREdWhRcFlxSExURzgrZ0pBd3Z0N2xWUlJ2?=
 =?utf-8?B?am1kcTZXMmZoSUk4c25SbnB1L05URHNSMjdydDZtM1doOEExQU5PajA1UmN6?=
 =?utf-8?B?RmVSRVEvM3RqdmJUWFBub1ZCYnQ2empDSVY5cW9OUDdQMllHQTRMNE1YaWY2?=
 =?utf-8?B?WFRqRFVCampQT1VVWmhkTzRuV2JNaURMRXJ5enkrellyam5xNjJZcUk4dEtY?=
 =?utf-8?B?STlRUUd4cC9OZU5WMHY1RmJXTSt4N3I0M0I3MVg3SmkxQ05HWW92OEplSFpG?=
 =?utf-8?B?Q1RDbmtkdnlqVHNLY3dCdGt6WUZ3bFlWbjVmbnB2NGVZZzNvREtHOEhBVndN?=
 =?utf-8?B?YzRaNzFFbHFoTnFlQjViSk1HN2tLZTJleTRSSGVTanEweWdmSGZzZVhMZkpY?=
 =?utf-8?B?TWNsMXpkSlNnN1NqVXdXWE1zazZjRVdueFIxMUM1WlNkNFprcG5DVUk3dzJz?=
 =?utf-8?B?STZac0FWOWJZMzA0dmdmbk5IUFpJbkx6NjFaVnMzaEFnVS85RXJzbVRseXl2?=
 =?utf-8?B?MjZZL20zVXo3L1VFS01VeFBETkowZ1kwVHhDMFgrRTZFekhJY2NObURQT0hE?=
 =?utf-8?B?RGQvOHNnbmRlelVlYWZ6ck9rbGZjVzdCakQ3YjVlbkZhaThCTWpkcXRjMDln?=
 =?utf-8?B?d1NJSWFpcUZZVmhmVU9kVVhiVjgxU2E2aFNJcThWcFNNRjNicS95Vlh2eUdw?=
 =?utf-8?B?amJ6L2lkRzhPSEN4RkQ1ZXhXWm5Sak40Nmo3TFAxTUNiZzBzMDV1eStyQk1i?=
 =?utf-8?B?Skw0dTlzaGt4eUtlS3JzWlVienZYSGhZaTdIWE5XVmY3UkN2ME9SaTZrS0lv?=
 =?utf-8?B?N3VseXVXeit4YVFocWZZZENNYkxHOUJsbDkvN25UVi9yQjhuT3pvYXU3bUVE?=
 =?utf-8?B?M1RDUk14N3crTUs2OUplVHVVekRHKzdDdjF3UnV6SWhSZVZJbnZyOXRQT2Nt?=
 =?utf-8?B?VW5McWJKV1Q5MTNPdkxFRXFJOE9VdVUzSDF3cXBadHBSbDNLdjNsbzVlQnl5?=
 =?utf-8?B?N0JUcGZ1SFRFL283alJLOHZrSnZrUnhTZzF1ZXlLa2ZnUlA1Y3NQaEN4d1By?=
 =?utf-8?B?aTg3eTEzNUszNGhSR2VXSzE4akV3MnNsYm05OTJjTzl1d0VYNUhyRGprOTlS?=
 =?utf-8?B?NzFYOUVmSXk2WkZYSlF1bmVjV0l1L3hKUjZSQ3VhTTBpWUs0SVQrOXhnY1dI?=
 =?utf-8?Q?TtKg91oU83wZkNSr5w+mDYLcOn7MiamZbMPfijb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9dfeec-f93a-4032-1ca6-08d9458e466a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 23:39:22.1036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bENckx69dWu8waNei2BSxWifwrIxa58W9g4zz9nDiZitkfb/IUvPzJky1hm6q9XWpXnxfGrh9GPoKT8TFxf2BgfukP3fOdNjUApzYDb5WoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6239
X-OriginatorOrg: citrix.com

On 12/07/2021 21:32, Daniel P. Smith wrote:
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index ad3cddbf7d..a8805f514b 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -747,16 +747,14 @@ extern int xsm_dt_policy_init(void **policy_buffer,=
 size_t *policy_size);
>  extern bool has_xsm_magic(paddr_t);
>  #endif
> =20
> -extern int register_xsm(struct xsm_operations *ops);
> -
> -extern struct xsm_operations dummy_xsm_ops;
>  extern void xsm_fixup_ops(struct xsm_operations *ops);
> =20
>  #ifdef CONFIG_XSM_FLASK
> -extern void flask_init(const void *policy_buffer, size_t policy_size);
> +extern struct xsm_operations *flask_init(const void *policy_buffer, size=
_t policy_size);
>  #else
> -static inline void flask_init(const void *policy_buffer, size_t policy_s=
ize)
> +static inline struct xsm_operations *flask_init(const void *policy_buffe=
r, size_t policy_size)
>  {
> +    return NULL;
>  }
>  #endif

As you touch almost every current user of xsm_operations and introduce
quite a few more, can I recommend taking the opportunity to shorten the
name to struct xsm_ops.

> diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
> index 01e52138a1..32e079d676 100644
> --- a/xen/xsm/flask/flask_op.c
> +++ b/xen/xsm/flask/flask_op.c
> @@ -226,6 +226,7 @@ static int flask_security_sid(struct xen_flask_sid_co=
ntext *arg)
>  static int flask_disable(void)
>  {
>      static int flask_disabled =3D 0;
> +    struct xsm_operations default_ops;
> =20
>      if ( ss_initialized )
>      {
> @@ -244,7 +245,8 @@ static int flask_disable(void)
>      flask_disabled =3D 1;
> =20
>      /* Reset xsm_ops to the original module. */
> -    xsm_ops =3D &dummy_xsm_ops;
> +    xsm_fixup_ops(&default_ops);
> +    xsm_ops =3D default_ops;
> =20
>      return 0;
>  }

These two hunks will disappear when patch 3 is reordered with respect to
this one.

... which is good because you've just pointed xsm_ops at a
soon-to-be-out-of-scope local variable on the stack.

> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index f1a1217c98..a3a88aa8ed 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1883,7 +1883,8 @@ static struct xsm_operations flask_ops =3D {
>  #endif
>  };

flask and silo ops should become:

static const struct xsm_ops __initconst {flask,silo}_ops =3D {

as they're neither modified, nor needed after init, following this change.

> =20
> -void __init flask_init(const void *policy_buffer, size_t policy_size)
> +struct xsm_operations __init *flask_init(const void *policy_buffer,
> +					 size_t policy_size)

struct xsm_ops *__init flask_init(...)

Otherwise you've got the __init in the middle of the return type, and
some compilers are more picky than others.

> @@ -1923,6 +1921,9 @@ void __init flask_init(const void *policy_buffer, s=
ize_t policy_size)
>          printk(XENLOG_INFO "Flask:  Starting in enforcing mode.\n");
>      else
>          printk(XENLOG_INFO "Flask:  Starting in permissive mode.\n");
> +
> +    return &flask_ops;
> +

Stray newline.

>  }
> =20
>  /*
> diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
> index fc2ca5cd2d..808350f122 100644
> --- a/xen/xsm/silo.c
> +++ b/xen/xsm/silo.c
> @@ -112,12 +112,11 @@ static struct xsm_operations silo_xsm_ops =3D {
>  #endif
>  };
> =20
> -void __init silo_init(void)
> +struct xsm_operations __init *silo_init(void)

Same here as with flask.

> diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
> index 5eab21e1b1..7265f742e9 100644
> --- a/xen/xsm/xsm_core.c
> +++ b/xen/xsm/xsm_core.c
> @@ -68,17 +76,10 @@ static int __init parse_xsm_param(const char *s)
>  }
>  custom_param("xsm", parse_xsm_param);
> =20
> -static inline int verify(struct xsm_operations *ops)
> -{
> -    /* verify the security_operations structure exists */
> -    if ( !ops )
> -        return -EINVAL;
> -    xsm_fixup_ops(ops);
> -    return 0;
> -}
> -
>  static int __init xsm_core_init(const void *policy_buffer, size_t policy=
_size)
>  {
> +	struct xsm_operations *mod_ops;
> +

Hard tabs, and later in this function.=C2=A0 Also, how about just 'ops' for
the local variable name?

> @@ -113,6 +124,17 @@ static int __init xsm_core_init(const void *policy_b=
uffer, size_t policy_size)
>          break;
>      }
> =20
> +    /*
> +     * This handles three cases,
> +     *   - dummy policy module was selected
> +     *   - a policy module  does not provide all handlers

Stray double space.

~Andrew


