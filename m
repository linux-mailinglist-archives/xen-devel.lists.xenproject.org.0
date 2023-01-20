Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E95267577F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 15:40:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481834.746992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsYg-0002AE-4j; Fri, 20 Jan 2023 14:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481834.746992; Fri, 20 Jan 2023 14:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsYg-00027O-1j; Fri, 20 Jan 2023 14:39:58 +0000
Received: by outflank-mailman (input) for mailman id 481834;
 Fri, 20 Jan 2023 14:39:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIsYe-00027I-6Y
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 14:39:56 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4be14ec6-98d0-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 15:39:53 +0100 (CET)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 09:39:49 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5198.namprd03.prod.outlook.com (2603:10b6:208:19e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 14:39:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 14:39:47 +0000
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
X-Inumbo-ID: 4be14ec6-98d0-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674225593;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=krikSJwJPtSfS/aPAT0ciI+5ihM6utcslkC35ZInVsw=;
  b=cR4VQHaC+j3jHhZc9XRlwM2enAk2YFwG1RgDAj1Grj+HkPHDl2PmcJY0
   HuCrY0YfURaCmR2FPoxEUGJp+jWTzN0a/K5LSqpWqpZD+VCAlWbpATgby
   GO4ksNvt0RM31FqFaUc1vYC1elO3/Ffb0rk6eJeqtAuGsR97a87x9Lmoi
   g=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 93494311
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5MM/P6JEZv2DEL7SFE+R55QlxSXFcZb7ZxGr2PjKsXjdYENShGZTz
 WpKDG7UOfqJYjGkeY8lbI+/oEoH7ZeDyt5lSwRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wZmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c57HF9Fx
 PooEQtdQQmI2MmEkIK4dPJz05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSJpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eexn+qBNlLTdVU8NZYglKY71c+EydMekGCgvWFpFKReoxQf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZdadkOpMIwAzsw2
 Tehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi+QPu6k2hxPLC9N8Sqi8i4SvHSmqm
 2zQ6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHa1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:Xot3hq1dtP3DrwM89PBfCgqjBdVxeYIsimQD101hICG9Kvbo6v
 xG785rjiMc6QxhAk3I/OrqBEDuewKkyXcY2/hyAV7mZnidhILKFvAk0WKB+UyZJ8SWzIc0v8
 sOHckfeb7N5BpB/L3HCWKDYrIdKay8gcaVbJDlvhBQpG9RGsRdB6oTMGum+wZNNXV77NICZe
 WhDk0tnUv5RZzCBf7LX0UtW+XO49uOjZjmaRkJCxNP0nj+sRqt5bL9Hxnw5GZhbxpfhbgl6m
 TLiAr/++GqtOy60AbV0yvJ441Rg8aJ8KoKOCWgsLliFtzXsHfgWK1xH7mZ+DwlquCm71gn1N
 HKvhc7Jsx2r3fcZHu8rxfh0xTplG9G0Q6p9XaIxX/45cDpTjMzDMRMwYpfbxvC8kIl+NVxyr
 hC0W6Vv4deSRnAgCP+7d7VUAwCrDv+nVMy1eoIy3BPW4oXb7Fc6YQZ4UNOCZ8FWDn37Yg2ed
 Mee/309bJTaxeXfnrZtm5gzJinRXIoBAqLRUAEp4iczyVWlGoR9TpU+OUP2nMbsJ4tQZhN4O
 rJdq5ykqtVU8MQZaVhQO8cXMqsDHDXSx6kChPfHbyvfJt3ek4k3fbMkfUIDM/AQu1K8HNy8K
 6xH2+xwgYJCgzT4e3k5uwIzvkMehTIYdyfovsuoqSRloeMMYYDaxfzO2zGu/HQ0ck3E4neQe
 j2O55TDrvlIXX1HIpVwgHkMqMib0X3UqUuy5IGckPLuM/LboHvvuzfevPaPqDsHjYvUn7+BH
 xGVj71OcVG8ka2QBbD8WjsZ08=
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="93494311"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqAFUmpi6UL8Ft3velkWCFr/19x23NhAgVJm10ECAkPNl0vhWW2CKs8ykAhCimwyKym4N2y3OtCMAJGg81YFpd8fR6I6dSqfePh7CemPa6j750vYNK59mXnSpuSctZrQ0c+0xDgBxzyzLFN5JvkojsHfs0Fk7ZwA21VkkqsEXRuFpPJ8C1DupIMom7+yiBR5/X4SWfuR3zWf3H4uCjyq1EvKzQWg8wy9lwSstr+RwuiajQnZS159ynr0TB8Uj5VBk5pie5cimt58lf9NjPcZpJl1CHf6k/zqBpD/1Xi4H6qcjarHmF9S5iUNK5SRMBR+/kPxKFK3Y8FZgS5z53pfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krikSJwJPtSfS/aPAT0ciI+5ihM6utcslkC35ZInVsw=;
 b=J+c13e0i3K8iFMCBGrzVwEqBZ71UyzSA8nJAO9RgCB4hBv8R4vTgCu+dIA0yG78Udvw6nyir9NiKbt0K5aMxErwNDbuwFpYSp3snmX6CznK5cgNsgpmQpnrEdNE+VDK9t+z1BCeg8rOuDOeumIvk0VYI48wmk1b5HfHDmNcYUmGK3abwACsAQnKjkmuKfv5eRRy6zLpCMqoDRCl76OY3nyUkZ1yU+wB7b7Uwt1HpQiLbz6N1DRCWpwPNRaTLaZ48B3k58c28d0jbDjoyQUWqSPVyk8VKkHF+OR6JPnqkNehGL41eZm6EaCmBIhCK+lGGb0cUMDK0zOcDn7MHwAYW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krikSJwJPtSfS/aPAT0ciI+5ihM6utcslkC35ZInVsw=;
 b=cMjH9EgKSxUOgdSzUo1Ld9d9WQJG6HzST3zzCf1xUpjvqXXoloU0hKswyXIwLC1F4bs9CpPfvSM4hybvehTGcgxPeEMtAYxFtl3xlDZ6VF0Yt9ofJynhVZ/2N+PVz257lvRcJxeHwCx6qHPRQuctDaeL3JihBULDLXAILPhfA7Q=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/shadow: Drop dubious lastpage diagnostic
Thread-Topic: [PATCH] x86/shadow: Drop dubious lastpage diagnostic
Thread-Index: AQHZLMTJYmmsHN9huU+OUU/Zg+9KvK6nR7kAgAAQrgCAAALWgIAABU+A
Date: Fri, 20 Jan 2023 14:39:47 +0000
Message-ID: <e8dc6e46-9669-063a-ddb2-b56bdaa97825@citrix.com>
References: <20230120114556.14003-1-andrew.cooper3@citrix.com>
 <f530ddfc-8f97-b913-e838-58cc352f6372@suse.com>
 <139c1d03-2cd8-a7c3-4f79-fbdd5e85c712@citrix.com>
 <1740f228-8821-97e1-6524-6a2ccff6d3cd@suse.com>
In-Reply-To: <1740f228-8821-97e1-6524-6a2ccff6d3cd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5198:EE_
x-ms-office365-filtering-correlation-id: c38068b5-8e3c-40d7-029a-08dafaf42ded
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YxQ1TS8hpy1iBUILNstqk9Tt2NXpnrhonZ6/hCaRHo301HXtQemzcOW1OYpGfFrg9aUslqFYAWaPJHnOBDWwlMiMzGMw2J1LgFBP2PofItgtG0K4x5xoklwx68FASvtuwTWqPMtSx6ELyJIbyhdyh9pLkcaQakhj+8p4DDTGW5nHdoUoJyJOwnXfWL7ECcnTfWy7/GJusTAyh+ra+1nwsosImQ2+p4XjfqN8BB0OHiZG5hbZnDdsoE1wlRuVxz0CjjB3E8ejwzuXTNBWiHo/JYl0QhQ8vgVNCOXRvijKyXcwwENeB/UVwIpi4LYDSGHHQ1PNxoX1mTGtChydX1l5AySlDVUdSdUmTUq5Z7et4S9558H0u/l1HtVfbOS+Rsxx5Pq5HM3UDI6uMaaLp0oeWYEKm8oyvkOXCMQx3io3jF4WJl8398g3Di0Qo+zPoIlGWwbWe7fgnm8KquZIYavbV93SIwD4/6qJ4yQfw0MfO6LvBmnjhKM9okuN1o2mtE4f5bzB25FESpR7oL1kg05ttXlCEfe+g8tdmQM+fK45wEtRMwj7X1X58OIuALBRYVdWpT4MMtfeln6/T4KYCaUOn9K33w0usrHrU8BGSF6wKOrRQltUFDin11CpxiG+f6nJzEAlY5qsQPFwiqnIF3zSw8WUFqfBlKEiUQhvtI9pBTjxKZngu0WhfhCKUtFiq+CM6ncRDu4tDdS0FZNz1Q4tPhy/ISc7fv5aK9TABA0iVY/YV1Szq1IO6ktrtuDHX/VtdQaqP6bJAVIHjgbiDy2bCg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(5660300002)(8936002)(31686004)(4326008)(66446008)(66556008)(64756008)(6916009)(8676002)(66946007)(66476007)(91956017)(76116006)(71200400001)(36756003)(31696002)(38100700002)(53546011)(122000001)(6506007)(26005)(6512007)(2906002)(186003)(54906003)(6486002)(478600001)(316002)(2616005)(83380400001)(41300700001)(82960400001)(38070700005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGZmdlQ1c1Y2WFNtMUVRWTRyOWtvR0tBTW5BMTFLQ0M1dTNnOXd4L0N4Uk9S?=
 =?utf-8?B?UG9Td09OYUUxOVRBWElqczBOcWpwVlY5bFgrMmcra1BTVFhuNEFhOEZuekFX?=
 =?utf-8?B?WE9Pd3lJZ0tNc2d1cUJIQWozRU1mWFVVZ3hLZjRRNXVKbVdzRkRwVTdraStY?=
 =?utf-8?B?emlVTzNrclpRU0hueEd2czJHOUhyd0xHNlUxOW5RMERCVmFweTlqOHZDM3NR?=
 =?utf-8?B?YUJVLzlkQUJBMTFBVk8zck5qZHR2S0RtVTBQM1pnTkc4aTB4Y3BYOVBYbE5Q?=
 =?utf-8?B?N28yelpUd0JjN09NZzV6dEVFazVjMFZ6T3NMekg3WmVCaGc5b1N5RWtIZU9p?=
 =?utf-8?B?UDA5NjhUaG55TlQ1TVdsMTJ0UkorcEl6NkZMcmEvcFVsTzhEeW9WSDdVYllp?=
 =?utf-8?B?RzlIRHpmVDhjUFBXUDVnNmtYYkswbXhOUFRiMHlSNTdPbHhlZUZjd0dtUTF4?=
 =?utf-8?B?d3AvNWxPbTVpQ3RNVWtMNWR6QjNWKytIbUp5cXVQUVp3Rk1zbHhHVlpkd05J?=
 =?utf-8?B?ekFROEpTdzJlb0ZnQ3czSDJSa2RCK01YMGorNkh4b2JvU05rUXphejB2dm5W?=
 =?utf-8?B?aFJSak5lZW4wWDVBNzdtQVY4TjVQMzg2NmVCUlVQNTdtY2U3YVBIM3Q2Qzln?=
 =?utf-8?B?Q1ZOR3lCcTlVaVlsbklqSDVMYlNhb0hJT0lUaVF2UkNjNXp1cVg5Nzd0Nllx?=
 =?utf-8?B?ckY0bStMNWtwRCtGRi9XWUhWQmsyclpwZnZ4VXFWRjhZOTljajVJN2g3RXR0?=
 =?utf-8?B?R2JSTDNTZlJRZmtuUVpnRzlSaEpvck15dW5rb3Ftd0U1T1IvdUlad3J4UklH?=
 =?utf-8?B?RmdUbDVVZURXWkdKZThQWFFZNDFIcWlQalN1MHV1TmgyR29BOGQyZGxXV2NO?=
 =?utf-8?B?Vjd2QmE0MXpvN1ZjMXRZWkpJZVVNN3Rqa2hUdVRtRnQ2L2M4ZEZHSU1zMDQy?=
 =?utf-8?B?dkdFcFNVTVlrQjhFRVlXaEx1cFMxSHd3VExvMnQzZ0pxbTd1eVpVYnVGVnhN?=
 =?utf-8?B?aTFPSDZBUUpZQ2w4VEp6bUs4NzNmTWw3cVVwajV2QThwT0VTSzJKc0pvK3dP?=
 =?utf-8?B?eFdJV1pvZ21ieHNpS3hZaTl2RXd1eHBobzB1TG03Um5kbFJmRVZIVnU4ZFFS?=
 =?utf-8?B?NVBURWxXd2lDWk1lRGwwYzFPUnVyR001T3VqVTAvRXk2YUtXejIvaGwyT3BT?=
 =?utf-8?B?V1BCR1dXL2dwTTNjOE4vRWE5V1dyL2ZEUFVKYU5DMHp2OUxLeDk5SVBBSzQx?=
 =?utf-8?B?SWRMMGVDR05vRm45cU9OcEhmdE1NREF1WFZEUnJDOEV3RS9lem1sRzgwMFZs?=
 =?utf-8?B?aDJZa2hhOHRVWGhpMXRFWEEvTkt6WU1Ud0dEcHlpamVkeU9qN2R6V1lhUnEr?=
 =?utf-8?B?OFp6UURyS0F4NnFrTGV4aDFubEFDbVhqWFEvSjg0QjRQc0lFWWxVYkNCS0RR?=
 =?utf-8?B?eG9ZSXd3T3BVbmRjQk1GaXlsNkNEY2thbWkrWDZhUUF6WTRQVkdwRTFiT3JF?=
 =?utf-8?B?MkNmdS9YVmVSblNTYW1WaVdjeFVEdVdHSVROaXRlVnIzaE1zOG0xWGY1VUVU?=
 =?utf-8?B?ZWxFMzUzcTFpdmh0UTRhZmhMTHN5ZEhBcUZZTFE3UWNIWlhlWXdTT3Y5bTNs?=
 =?utf-8?B?NFh5Ym1hS28vK3l5YlRic0o0Nzk2anYzVFUza3ArdGNUdlluSjUwNmZ1VVI0?=
 =?utf-8?B?QU1LRGdMalJhOE0vVFpWeWpKMHFXM0FpSFFIOEtGVTQ1NEJ2R0ZzSGsvcVRu?=
 =?utf-8?B?K240Rk1lM2VsR3JMMEM0S0xpZTl6d0NkR3BPQlY5U3FMMFFKN1JSMkxsd0ti?=
 =?utf-8?B?K0pKdkpVV2ZFNXlNUnZMS1VSOVllNVp3eHdjM1owK3Q4dnUxclhNYUE3Z3Qr?=
 =?utf-8?B?Z2dQNjdleFpoVG5xWmlEQXhmQjErT2NSSzdtZ0grbXp5VGlZY0Z4Mk1QdCtr?=
 =?utf-8?B?U2hvL091VlA1NkhKeGVsYndmeFFGMW1LZUM2TEdPbEh6dkkyWkdUNlBjMUhW?=
 =?utf-8?B?OUpsNzRZZzE5NUdiT2VqaDA1c2xxZWZXYmJJcVdTY2RQbytvTWlYOG1pTXVY?=
 =?utf-8?B?K0dTMTA4aFh0RWlYMkJsOUVCRjRSZm9NWmd1TkIzemVWMXRxZktOV0FDekdZ?=
 =?utf-8?Q?pTrbwioOMyJNm/gGXo76TcHut?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27822AA8B6C7F14FA99F8723DCBAB407@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uPnQEOdOp/+27wlHgf56C9S52lZX7HTxiQbUtE7WUFR0rWLdC4/Z1fH6eG2vkEg87aY+IB+o5Lu9YSOm5y0btjnnRb7DYt55i4K3HXEV1aZnQk6BEd9ye6LenKhyosxtSVeL4as9OOvrm8b95ceM3eep4qplbwutrbe3R8TXHOlveXbQNIojjYCtsvOxKx/BzBEVV1ZYdbZatv7AT0MPypkL3imEv0Gau0MgxIrFzV20Y29TdzDVaS2QFxNBnUyY8qAefaeYSTOKcFPHRMuokvO+X4+J5H2fhJQx+bMNWUxkjS0FNvvRUK7eTcDiKJCIEL18uHvdM/SIPmVJ3iztZLaUPiZHloLEeZdCyYMW6F88u6l0HoXz64UzhZeinegZ/NEycxsIQ9VJIGz0w8N0rQ6wZHamtrlfy8gz5S07iw38hKCyBVsUUzkg94uZHR9Gauw9LETM4ulpZwpecdUouensxjtt7QOip+HOOkqPfZPF4aVw2K1DHTk3CmBtaoynrFzhuKY0W8RWhF9RPIay5JM+HUxdZOjTg3xZoVUsVlZUTP/60NcQHlA0fMXBQN7ZPYDKaEDHvXLdRTk1uemtfJBClH81LekXaid2DqgHGlkEVCTjeSHGLzJ6IEfZOrhe7Ac/vC/IvqmRpaXp5Pk+XlHcPy7pqfi8cSEtNOJlj8E1OBRJirxY3J2oBIIkNvQ+OY2vv1Op0r5PFmX4sC4qIhayV7ofIwSiIKgHtJaHsKD81xtuNM2VyxT3cJVZ2xf//uvhTLq0XEPt+JUNttkiq59mnD5287yj6dWySGLMINVX/3JNnMlxM+pGzBzLRYzT
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c38068b5-8e3c-40d7-029a-08dafaf42ded
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 14:39:47.5349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eqNSoowYTV5frzSFhle2idT9G7o5eFVNyzBGXh8qi4/4kbt5znfZPOK+DZHMLTbCr7BQ7t0i8Ry9ptqWmnBZa+6woS/NdOvCQmfyeT4RtIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5198

T24gMjAvMDEvMjAyMyAyOjIwIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjAuMDEuMjAy
MyAxNToxMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDIwLzAxLzIwMjMgMToxMCBwbSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMjAuMDEuMjAyMyAxMjo0NSwgQW5kcmV3IENvb3Bl
ciB3cm90ZToNCj4+Pj4gVGhpcyBpcyBhIGdsb2JhbCB2YXJpYWJsZSAoYWN0dWFsbHkgMywgb25l
IHBlciBHVUVTVF9QQUdJTkdfTEVWRUwpLCBvcGVyYXRlZA0KPj4+PiBvbiB1c2luZyBhdG9taWNz
IG9ubHkgKHdpdGggbm8gcmVnYXJkIHRvIHdoYXQgZWxzZSBzaGFyZXMgdGhlIHNhbWUgY2FjaGVs
aW5lKSwNCj4+Pj4gd2hpY2ggZW1pdHMgYSBkaWFnbm9zdGljIChpbiBkZWJ1ZyBidWlsZHMgb25s
eSkgd2l0aG91dCBjaGFuZ2luZyBhbnkgcHJvZ3JhbQ0KPj4+PiBiZWhhdmlvdXIuDQo+Pj4+DQo+
Pj4+IEJhc2VkIG9uIHJlYWQtb25seSBwMm0gdHlwZXMgaW5jbHVkaW5nIGxvZ2RpcnR5LCB0aGlz
IGRpYWdub3N0aWMgY2FuIGJlDQo+Pj4+IHRyaXBwZWQgYnkgZW50aXJlbHkgbGVnaXRpbWF0ZSBn
dWVzdCBiZWhhdmlvdXIuDQo+Pj4gQ2FuIGl0PyBBdCB0aGUgdmVyeSBsZWFzdCBzaGFkb3cgZG9l
c24ndCB1c2UgcDJtX3JhbV9sb2dkaXJ0eSwgYnV0ICJjb29rcyINCj4+PiBsb2ctZGlydHkgaGFu
ZGxpbmcgaXRzIG93biB3YXkuDQo+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+PiBBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gVGhhbmtzLg0KPj4NCj4+PiB3aXRoIHRoZSBsYXN0IHNl
bnRlbmNlIGFib3ZlIGNvcnJlY3RlZCAoaWYgbmVlZCBiZTogcmVtb3ZlZCkuDQo+PiBJIGNhbiBy
ZW1vdmUgaXQsIGJ1dCBJIGZlZWwgYXMgaWYgdGhlcmUgb3VnaHQgdG8gYmUgc29tZXRoaW5nIHRo
ZXJlLg0KPj4NCj4+IFRoZSBvdGhlciBSTyB0eXBlcyBhcmUgcmFtX3JvLCBncmFudF9tYXBfcm8g
YW5kIHJhbV9zaGFyZWQuwqAgc2hhcmVkIGhhcw0KPj4gaG9wZWZ1bGx5IGJlZW4gdW5zaGFyZWQg
YmVmb3JlIGdldHRpbmcgdG8gdGhpcyBwb2ludCwgd2hpbGUgdGhlIG90aGVyDQo+PiB0d28gaGF2
ZSB1bmNsZWFyIHNlbWFudGljcyAoYXMgbmVpdGhlciBleGlzdCBpbiByZWFsIHN5c3RlbXMpLg0K
PiBJJ2QgYmUgb2theSBhcyBsb25nIGFzIHRoZSAiaW5jbHVkaW5nIGxvZ2RpcnR5IiBwYXJ0IGlz
bid0IHRoZXJlLiBJZg0KPiB3ZSdyZSB1bnN1cmUsIHBlcmhhcHMgdGhlbiBhbHNvIGluc3RlYWQg
b2YgImNhbiIgZWl0aGVyICJtaWdodCIgb3INCj4gImNhbiBwb3NzaWJseSI/DQoNCkknbGwganVz
dCBkZWxldGUgaXQuwqAgSXQncyBub3QgaW1wb3J0YW50IGVub3VnaCBmb3IgdGhlIHRpbWUgaXQn
cyB0YWtpbmcuDQoNCn5BbmRyZXcNCg==

