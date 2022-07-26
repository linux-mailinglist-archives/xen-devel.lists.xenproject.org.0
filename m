Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED16C581262
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 13:52:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375164.607488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGJ6E-0006nk-VX; Tue, 26 Jul 2022 11:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375164.607488; Tue, 26 Jul 2022 11:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGJ6E-0006lc-Sb; Tue, 26 Jul 2022 11:51:42 +0000
Received: by outflank-mailman (input) for mailman id 375164;
 Tue, 26 Jul 2022 11:51:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DB1L=X7=citrix.com=prvs=199b7977f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGJ6D-0006lW-96
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 11:51:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c0bb575-0cd9-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 13:51:37 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jul 2022 07:51:32 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Tue, 26 Jul
 2022 11:51:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 11:51:31 +0000
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
X-Inumbo-ID: 4c0bb575-0cd9-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658836297;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Nth+WSRqmnNZNtt/75bzbUKnlGqNX8w23rCVYKIJuKo=;
  b=LyPnSYcClexjnCUWP6U6/hUopEBJvKvYArAgpFvFsamT0ex6LFwOrVHf
   lhQ/Al1wCYAAuLQUN0qHG00IAUsgCMbIz/oxA6EK9SS5qZqzT9rIxqirn
   WAqYHTetF8h1WDcXcO5L93skcYq3qFUVUoJSbb/DcBBTHJPia+zUASNVd
   E=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 76640460
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5uHLD64SPdjq7FLDG6AOPQxRtBDGchMFZxGqfqrLsTDasY5as4F+v
 mVJWWyCbPmKM2ekfNggb46w9E4GvZaEndYySFE+qSg2Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ksw5qmq4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJHoUYKMG4aU0Oj9f/
 +I+LwACTVeohf3jldpXSsE07igiBO/CGdpG/11Fk3TeB/tgRo3fSaLX49MexC03ms1FAffZY
 YwedCZraxPDJRZIPz/7CrpnxLvu2ia5LmIe8Q3MzUY0yzG7IAhZ+b7hKtfKPPeNQt1YhB2wr
 WPa5WXpRBodMbRzzBLarCzw3rORxUsXXqoINeWm+fla2Ga1z1QpCREqUUWi5sCA3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JPF8Uq5QfLzbDbiy6bCXIDVSVpc8E9uYk9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmM4D8LLpYgyilfDS4hlGavs19ntQ2ivm
 naNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFzFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:jxPFIKNAp5yaj8BcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw6zvmWehTNYd3E8LAs27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="76640460"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epSsEYsNYfat0NkMoYEbX0BJggvdcxyyrvRyd4U3CO5sEe8NFvsuSSxiQhFQ+K43WcPluIPoup8yVnJscRkS/2vhJvrQ/EbutOOQpgLyM+8FiEMuEh+rpqmq37BFhADknravkfPpl/bvwsMa5YFyYmok4+mLF4SyUaF/bluEPdt5OtImBEp3D5Xq/Ru3wtaqoBsa3psRKdxgKonDhzhu73qAjHElmdt0h39mnotnJ1t0fWGpunfEK3Wg70rFGa9AZEIbTQh5yk/zKlYt+AiCxnVZYng5jUdVsMzkTeqb4XtZlXg2KWyKG9G8P4W5hWXEEe/Xtt/XY89+cBZFv7eQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nth+WSRqmnNZNtt/75bzbUKnlGqNX8w23rCVYKIJuKo=;
 b=JCotkaGe6FUkkZ4ZWawMUHHo68doySPqKskyHDMm69iTTF1SQk7kxOIZBGC72QZZDKBd1ZGDNm5uzIVivCLTdURhkSebkAxza9BchbwxfSTJAbO+qMo3YZZ6xTxCrigfrs0gWqrmVwdA/afsqoNWcfa/on+XoJc14g8iw8i8VAB9CFuais3EJoWzZR547knNDYfmE6q9aTw/pA9pYnMwde50S4bhp29AuY9Xw8gblTHbA/zOtciIVmG6lJ+aivtgB7bII+x52ZY7SIL0YnvYMGrZ1RcECl/ytoLvHiO7GwApud/niKi+iwdJn/kwrc/f5xqJjiDr/WHYAsQOgTf8Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nth+WSRqmnNZNtt/75bzbUKnlGqNX8w23rCVYKIJuKo=;
 b=Fe4Yplo5+f0DBAJ6A4hcEUAC3VW21VxVDa9Nd18wY/Ipdg6iVy3Eesnv+TtKb1POEGaJP7PbvB64AIDuwhMNULGLkiwPHrh+VhQOuI9foj/Skv3jcRjtF8F6cG5t/E8haxJfru7p8Oa+lt30p0PsNFIAQpfywg63lhpXPBhXqDQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/pv: Inject #GP for implicit grant unmaps
Thread-Topic: [PATCH] x86/pv: Inject #GP for implicit grant unmaps
Thread-Index: AQHYoE8VWDFxrfk+kEi+iIsPWlNsBq2QMZQAgABZ5AA=
Date: Tue, 26 Jul 2022 11:51:30 +0000
Message-ID: <c7a8a191-18af-23c1-c57b-1de3f1187384@citrix.com>
References: <20220725175013.893-1-andrew.cooper3@citrix.com>
 <b4f1ee8c-d83f-d56f-e72e-d1e0fd4b2228@suse.com>
In-Reply-To: <b4f1ee8c-d83f-d56f-e72e-d1e0fd4b2228@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6d4f2c0-65bf-4383-c281-08da6efd2e5a
x-ms-traffictypediagnostic: MN2PR03MB5008:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zGpxmL7sBUh+0l6CyT+92tKdqAs5Fp8Fav0xupx1nog/S+eV8e7LO2cCgVFKwqVxplKgQrMf5s/Il+E4WfH6kiRDpMprvI/U08J6vqqm60LWK+DvVJIwyHiKnjwRSPSS/JWAEqf+mKsOnIbzEQiv/o6bAumU1KcP9T385QQvuYyFJJK+WzXnjowqC8q2kDPASZt4HJ5/C0iqP5/xBXkONwu9gONJM0BIrJ8dXgwpNj1+Euyt+rAfab4wlvmi2Cm3U3GCgpAbcWewBf7KkxjEAVgXa+jmLngSSYORMNf/Jvtgi4RJWt2QsmzR2Wj7swIbFRUXNfax+fnroYlHCCPHMbdNztGMb8zGVHP8gChMhYBKC1JGsuCbm5DQsaD8xIRDTgezJGFzSruAKvmh421nARG+K49D5qY+gKgfpRndpOdDnvEmtji1sFQzd/YG8Z6kL/9IyU/L/Kl139J0WqhGtgMEAdKCs2+56jxXrKM7k/0L50IALUwP3fn5cX88eWGir9OqwhagP0JGuDRARHODh3paUJ6MK1MgFpWCxSXDNrjdGHE/zuZXaOgk4ZYjCgGIF5nLOKBC+2rOBse3PuruFgKjYyX4OSvnFE6eyAuu5r2bD27pxqNCrovwdJWOo0mZz0TqMjOlhhYLJEbg5tyQNzf2BTBdnaeKlGn8+e85Ow6+jNTXUEPxiPv1ykzcq+hf7hXEKd1N9cvFU9qagmJLdEhXIDdbNUa7I4aNHGuiQEyj5fwYSEzr0czWbY0t0fupQIQlhcpD3Lo+vGN0q6IeqVxSyUn50qeu85qkibMCwquVqBcNpGZTD+VoUoHPt3Uwxef9jm9AMLp63SIZeXReMvGxfFgycZh0KiT7NivUmvg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(71200400001)(66946007)(122000001)(76116006)(6916009)(54906003)(6486002)(316002)(478600001)(66446008)(5660300002)(66556008)(91956017)(66476007)(31686004)(8936002)(4326008)(64756008)(8676002)(36756003)(6512007)(2616005)(6506007)(41300700001)(26005)(53546011)(2906002)(186003)(38100700002)(82960400001)(83380400001)(31696002)(86362001)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjJjNFI1ZmtNSjRETEdyV25wd3JHWlBUMTE3Z2ZtVEs5NjB6ZUxSeG9HQTd6?=
 =?utf-8?B?enZhdms1Ukhzc25id1NYVC9jME9PKzIxekVqMUtmYmpWSVlXNFA2OHNwS1Ew?=
 =?utf-8?B?THhIeFN5d1JCMnhCOEhSRzdMQ0wxU0xPUVRueHVaQmcyaXloUklyZ2k3Zkd2?=
 =?utf-8?B?M1FXTjgwbVBIaDA3ckpLNElTRWpGRExaT29vdHc5ZUhkSEhKRDdaNmtuSGVR?=
 =?utf-8?B?ZXNoOHBRbENneklScmxOQ2JXUVlueXlSTXdRWG5kWWhRMCtjQTlJNmRhamov?=
 =?utf-8?B?dU14cmFWTXFjNkhQcXg1ZU5ZbU1pUm5vQjJTeTliL1orOEhOVFZkelQwTTV1?=
 =?utf-8?B?bGd5TW12b2gxcXJqMDRKS3pZanlTV2lFQkxmSXd3bHJVN1FRVVV5akpXUm44?=
 =?utf-8?B?SUVWVnFNMDRoaXVtempHOUVYVHVsSUdUVStJaXliTSs2OFFGMDE3VE1pU0E0?=
 =?utf-8?B?SUhiVTgxV3lVOGlwTDFkZnFpTXdkYWh6ei81UHdobjZsUENCcDZubGlUc3RW?=
 =?utf-8?B?Qi9ZZTVNc1BhTXZUNUhHMnFtSUxqbnBCandvTmlKMUR5WlhhSW80ejJhUEFr?=
 =?utf-8?B?MkNlQnpxQlBoT25VWGlRcFhMWGE4Q1ozWVBSSXR5MWZJTk9rcUxNeUhKZGhy?=
 =?utf-8?B?M0hDUzRxb2ExY0ppU1QxbjVrbHdPN2JoOUZjTlJmVHEyV0s1dFN5RVFHTVhX?=
 =?utf-8?B?cFQvWWJtenF0eVE2ZnlXajg3OGVlTDB3TzVIS3pmd1M0V0hvNmJQU2xmNDdS?=
 =?utf-8?B?REpxalF2WFgycU1YeXpIdFZOU3RJK1lJK1duTkN0L29aVEtXVktjemprcWFk?=
 =?utf-8?B?VXJrYWdMNzh3SThSSVpYd2RUSHNNa3FvejVkOE16bkk1Mis5aEtpT2JPTGw0?=
 =?utf-8?B?VktmMUJFSFJnM3VnWE90bnJaVk5CUnBnRi9RM1AxMk1UTHFtVGgzSzdOVGpW?=
 =?utf-8?B?d2ZGMUI3QmMvT1JpUjU4eHgwcHZFMGx4aklORkYyMXNDZ05JUXhGU1JpM2Ux?=
 =?utf-8?B?OGorYTdhellhK09reWFyOGwrQmtndFpmaW9LNkFSY2hvWjlwYloxOFp2aTdO?=
 =?utf-8?B?bUdWdmUwZFB0blVjcFFPVEF1QkZDTitxaHpiUnB5cVRuK05hVWZ3RnIvWDk5?=
 =?utf-8?B?UlZIZTlRQlhZb1o2MllGY3JEVU9VMVJxVlB1Wm5qbUtQSWJVSGVHV0JTcXBM?=
 =?utf-8?B?SHJiVUlmNG1tVmR3SHVlTm5vRmEyRHQyRGpoMHpqcVB5d3ROZ2lRd25lWnhk?=
 =?utf-8?B?eDFxa3dab3ZUMjl5YnZBTHp1Y2ViRXg5d0VrMFNJTkdDNlp6aUkwaitOZk41?=
 =?utf-8?B?aDU3OFA1ejZ2UCttaHJ3aTg2MkVxdHdxMWpBeGFQMjlMVm1hbWNxZ1J2UDJQ?=
 =?utf-8?B?RmYyTjVuWG00M2dZYXJDbFVxN1JjK3NTaFB4TDFFcnk5bS9VbzBjcDRFRXoy?=
 =?utf-8?B?R3c2K0pNOXpxbW9DNU44N2czOWcvUjBqRE9iVHczbEkrSFJjLzRGK1h0WmF5?=
 =?utf-8?B?SWU2RVRoSmdZSmhhK0wyN2VQbFVpTjZmY1Y4cVpKM3hTTTgvTGRTZk1UcWNH?=
 =?utf-8?B?VjRhMFlVUzNHeE40TU5PeEpxbWF5MU1kVXRxZEZrZ29EaGRENDF1Q20rUG9B?=
 =?utf-8?B?VE1iUThEL1VCRHg1M3VESEZaSlJmMFloQ0RyVFNRZVp0c0tIQVY4N0lGd0lW?=
 =?utf-8?B?M1V2NWI4MUVGV2dEVC81L3V2RkpXZGJ6SWV5SXZWQklJWWlaeTVDVTNFZ0d4?=
 =?utf-8?B?RTRqdnhrYlNYSWZlM2lNaFBhalo0bnRLWCttRERSWVlSMDF3WjZ0ZmprT0x1?=
 =?utf-8?B?dFUzbHkvdzlES080UWJKY21XRVNHd1V4U2NpcVI1bitRSlJpQk5SbHBYUTJm?=
 =?utf-8?B?blVDYldXSHhkTTRsd2RTR1B1ZHRCUHVYWEpwcGozeW42T3Bmak5LenFHb0RJ?=
 =?utf-8?B?andrU0JOMlBHRTQwMkRtMklGQjFkMkUxY0RjVTUvYzdIUWlTR1hGZEtaZG9J?=
 =?utf-8?B?UGVMdHpTRllMMkNiQTRRVmZwRW1NalRLNkhDVEdUZnFlYUwvS0o5K1RTRStM?=
 =?utf-8?B?aEpXV3VVRy9KOUZwemRIU1pWYTNZQmZiWlNlL2ZZdmdPeGhLTGlxZ2g4eU54?=
 =?utf-8?Q?2sSshN+MAzBXeGN0C0z6OqE3/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DC6AA56A17CC54883F141C96C902D7E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d4f2c0-65bf-4383-c281-08da6efd2e5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 11:51:30.9671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQ7XaAHBwIA7JO43PsgYC/xvhwUvfamLOgiUufThIaVnxSxWtULSAFEsXB+i8/Vk3HuLmg2eUjD/LopEhMVf1WkbaGP1HuJgIQo6dc7vpDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5008

T24gMjYvMDcvMjAyMiAwNzoyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI1LjA3LjIwMjIg
MTk6NTAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBUaGlzIGlzIGEgZGVidWcgYmVoYXZpb3Vy
IHRvIGlkZW50aWZ5IGJ1Z2d5IGtlcm5lbHMuICBDcmFzaGluZyB0aGUgZG9tYWluIGlzDQo+PiB0
aGUgbW9zdCB1bmhlbHBmdWwgdGhpbmcgdG8gZG8sIGJlY2F1c2UgaXQgZGlzY2FyZHMgdGhlIHJl
bGV2YW50IGNvbnRleHQuDQo+Pg0KPj4gSW5zdGVhZCwgaW5qZWN0ICNHUFswXSBsaWtlIG90aGVy
IHBlcm1pc3Npb24gZXJyb3JzIGluIHg4Ni4gIEluIHBhcnRpY3VsYXIsDQo+PiB0aGlzIGxldHMg
dGhlIGtlcm5lbCBwcm92aWRlIGEgYmFja3RyYWNlIHRoYXQncyBhY3R1YWxseSBoZWxwZnVsIHRv
IGENCj4+IGRldmVsb3BlciB0cnlpbmcgdG8gZmlndXJlIG91dCB3aGF0J3MgZ29pbmcgd3Jvbmcu
DQo+Pg0KPj4gQXMgYSBidWdmaXgsIHRoaXMgYWx3YXlzIGluamVjdHMgI0dQWzBdIHRvIGN1cnJl
bnQsIG5vdCBsMWVfb3duZXIuICBJdCBpcyBub3QNCj4+IGwxZV9vd25lcidzIGZhdWx0IGlmIGRv
bTAgdXNpbmcgc3VwZXJwb3dlcnMgdHJpZ2dlcnMgYW4gaW1wbGljaXQgdW5tYXAuDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4N
Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4NCj4gQWxiZWl0
IHByZWZlcmFibHkgd2l0aCAuLi4NCj4NCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jDQo+PiAr
KysgYi94ZW4vYXJjaC94ODYvbW0uYw0KPj4gQEAgLTEyMzIsNyArMTIzMiw3IEBAIHZvaWQgcHV0
X3BhZ2VfZnJvbV9sMWUobDFfcGdlbnRyeV90IGwxZSwgc3RydWN0IGRvbWFpbiAqbDFlX293bmVy
KQ0KPj4gICAgICAgICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsDQo+PiAgICAgICAgICAgICAg
ICAgICAiQXR0ZW1wdCB0byBpbXBsaWNpdGx5IHVubWFwIGEgZ3JhbnRlZCBQVEUgJSIgUFJJcHRl
ICJcbiIsDQo+PiAgICAgICAgICAgICAgICAgICBsMWVfZ2V0X2ludHB0ZShsMWUpKTsNCj4+IC0g
ICAgICAgIGRvbWFpbl9jcmFzaChsMWVfb3duZXIpOw0KPj4gKyAgICAgICAgcHZfaW5qZWN0X2h3
X2V4Y2VwdGlvbihUUkFQX2dwX2ZhdWx0LCAwKTsNCj4+ICAgICAgfQ0KPj4gICNlbmRpZg0KPiAu
Li4gdGhlIGdkcHJpbnRrKCkgYWRqdXN0ZWQgdG8gYWxzbyBsb2cgbDFlX293bmVyLg0KDQpPaywg
aG93IGFib3V0IHRoaXMgaW5jcmVtZW50YWw/DQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
bW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jDQppbmRleCBiMzM5MzM4NWZmYjYuLjc0MDU0ZmI1ZjRl
ZSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jDQorKysgYi94ZW4vYXJjaC94ODYvbW0u
Yw0KQEAgLTEyMjksOSArMTIyOSw5IEBAIHZvaWQgcHV0X3BhZ2VfZnJvbV9sMWUobDFfcGdlbnRy
eV90IGwxZSwgc3RydWN0DQpkb21haW4gKmwxZV9vd25lcikNCsKgwqDCoMKgIGlmICggKGwxZV9n
ZXRfZmxhZ3MobDFlKSAmIF9QQUdFX0dOVFRBQikgJiYNCsKgwqDCoMKgwqDCoMKgwqDCoCAhbDFl
X293bmVyLT5pc19zaHV0dGluZ19kb3duICYmICFsMWVfb3duZXItPmlzX2R5aW5nICkNCsKgwqDC
oMKgIHsNCi3CoMKgwqDCoMKgwqDCoCBnZHByaW50ayhYRU5MT0dfV0FSTklORywNCi3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiQXR0ZW1wdCB0byBpbXBsaWNpdGx5IHVubWFwIGEg
Z3JhbnRlZCBQVEUgJSIgUFJJcHRlICJcbiIsDQotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbDFlX2dldF9pbnRwdGUobDFlKSk7DQorwqDCoMKgwqDCoMKgwqAgZ3ByaW50ayhYRU5M
T0dfV0FSTklORywNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkF0dGVtcHQgdG8g
aW1wbGljaXRseSAlcGQncyBnbnRtYXAgUFRFICUiIFBSSXB0ZSAiXG4iLA0KK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBsMWVfb3duZXIsIGwxZV9nZXRfaW50cHRlKGwxZSkpOw0KwqDC
oMKgwqDCoMKgwqDCoCBwdl9pbmplY3RfaHdfZXhjZXB0aW9uKFRSQVBfZ3BfZmF1bHQsIDApOw0K
wqDCoMKgwqAgfQ0KwqAjZW5kaWYNCg0KVGhlIHByaW50aygpIG5lZWRzIHRvIG5vdCBiZSBvbWl0
dGVkIGluIHJlbGVhc2UgYnVpbGRzIHdoaWNoIGhhcHBlbiB0bw0KaGF2ZSB0aGlzIGxvZ2ljIGNv
bXBpbGVkIGluLg0KDQp+QW5kcmV3DQo=

