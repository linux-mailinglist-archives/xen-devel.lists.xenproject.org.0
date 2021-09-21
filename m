Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49424413B17
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 22:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191887.342030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSm3x-0003U3-Pi; Tue, 21 Sep 2021 20:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191887.342030; Tue, 21 Sep 2021 20:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSm3x-0003SG-Mb; Tue, 21 Sep 2021 20:08:21 +0000
Received: by outflank-mailman (input) for mailman id 191887;
 Tue, 21 Sep 2021 20:08:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QjZ+=OL=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSm3v-0003SA-IX
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 20:08:19 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc9e650f-1b3c-4feb-8bbc-a80e198b4684;
 Tue, 21 Sep 2021 20:08:18 +0000 (UTC)
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
X-Inumbo-ID: bc9e650f-1b3c-4feb-8bbc-a80e198b4684
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632254898;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/RcOwvX6G+A6yZfYmGyj4oEr/iP4SJj3cNoYoxqbAv8=;
  b=Smyvg2igo3ZTj3j+/Wnl+Sa2vRX+W1p727jssftOJiiHYq+V0F2hTHT0
   LmTP2rRRBAexVlm+CLMtw+8aidlHNI9kQyfxwETcFf6HTGj+1DvbhFPBc
   JcJMfTZoW255Xz09pLgEdd+/Sg+mKbzVbdKHmDxBJiozqR4sdrGElgxA2
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FJLzR/KIWUxgLnQrbub6wgBYMkXjlar5/HiZAaj/picWDuoT1+n/e9gcCiF5LWkfl6xfYxxCN+
 tbj/LCvv2FJX5XPOhXnio8Ry9YdA98dlheWdAspWvu32nGPOxHnZPNAeCrTNbXdhkbYakHNSPQ
 dw6F8gRy7abBtoTn8A6xArI0vx0mV4RxqRDujwEQHXmtDIpUMvez3Wl/ZjvKI+G4KYMHXrMQSi
 IZa+Nqorj7O94uQe+8vKMjhIi5Rc8IQw7x1uyRTqbVaUPISgmlC8t5tYAHIZwsfxDszxj4WinY
 o5NWYOAqCAnVluV/BxA73FTd
X-SBRS: 5.1
X-MesageID: 53252835
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6Y9hu6srlIRBzc9zwyzKuptJOefnVOBZMUV32f8akzHdYApBsoF/q
 tZmKW/TM/6MZWDyKo13Odyz9h4DuZ/RnNQ3GwFqpXgwRHlG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524HhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljbWRSzYMfYr3quUUbTwCDHwmN45Z0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DP
 JBEM2o0MXwsZTV1a3EJUbdkk96YqVLwYTBg8gmPmaEetj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3ErvDLtTP2XsQVDrLQ3txAjUCXx2cTIAYLTlb9qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+wl6imdx6zM+QGbC2MYCDlbZ7QOisgyQjA70
 06TqPngDzdvrb69RGqU8/GfqjbaES0YK2ASeAcPTBBD/sHupod1gx7SJv5hH7SylcbdAizrz
 naBqy1Wr7cOic8G0Y2r8FaBhCijzrDFQAc66QTQWmON9R5iaciuYInA1LTAxa8edsDDFADH5
 SVa3ZjFhAwTMX2TvBSkYec8OfKO3MSEOQP520EyR5MC6B34rhZPYrtsDCFCyFZBa5hfI2a5P
 hOL4Gu997cIYyD7NvYfj5aZTp1wlPm+T4yNuuX8M4IWCqWdYjNr682HiaS45GnrjEFkuqU2I
 57znS2EXCtCVPgPINZbQY4gPV4XKsIWnji7qXPTlU3PPV+iiJm9E+xtDbd2RrplhJ5oWS2Mm
 zqlCydv9yizrcWkOnWHmWLsEbz6BSdiXs2nwyCmXsWCPhBnCAkcNhMl+pt4I9YNt/0Mzo/gp
 yjhMmcFmAuXrSCWcm2iNyE8AI4DqL4i9BrXywR3Zg32s5XiCK7yhJoim2wfJ+h/qLM7kq4qE
 JHouayoW5xyd9gOwBxEBbHVp41+bhW7wwWIOiuuej8keJB8AQfO/7fZksHHrkHi1wK76pkzp
 aOOzATeTcZRTghuFp+OOvmu00mwrT4Wn+crBxnEJdxaeUPN9ol2KnOu0q9rcp9UcRiTlCGH0
 wu2AAsDobWfqYEC79SU17uPqJ2kErUiExMCTXXb97u/KQLT4nGnnd1bSO+NcD2EDDH09ayua
 P971fb5NPFbzl9Gv5AlS+RgzL4k5suprLhfl1w2EHLOZlWtK7VhPnjZgpUf6vwTnudU4FLkV
 FiO999WPaSyFPnkSFNBdhA4aumj1O0PnmWA5/oCP0intjR8+6CKUBsOMkDU2jBdNrZ8LKgs3
 fwl5JwN8wW6hxcnboSGgyRT+zjeJ3AMSfx65JQTAYutgQs30FBSJ5fbD3ausp2IbtxNNGgsI
 yOV2/We1+gNmBKafiphD2XJ0MpcmY8K6UJDw1I1LliUnsbI260s1xpL/DVrFglYw32rCQ6o1
 rSH46GtGZizwg==
IronPort-HdrOrdr: A9a23:W6qbCKFjUwHxiGTtpLqFf5HXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HkBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4lgPO
 JbAtJD4b7LfChHZKTBkXCF+r8bqbHtmsDY5pas854ud3APV0gJ1XYJNu/xKDwReOApP+taKH
 PR3Ls9m9L2Ek5nEPhTS0N1E9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXkHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMW9yV0qp+1WH/ebcGkjaRny9Mw8/U42uonlrdUlCvgklLJd1pAZHyHo/I6M0r9
 gsfJ4YzY2n46ctHNVA7dw6ML6K41r2MFvx2VKpUCba/Z48SgbwQr7Mkf8IDbKRCdE1JKVbou
 W2bLofjx9rR37T
X-IronPort-AV: E=Sophos;i="5.85,311,1624334400"; 
   d="scan'208";a="53252835"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coX+2saowqZIDlN2NH7rKzFlHjReiRobcXBD/4x54Jx7fIH4Umumcq9TsgfJdmwVkipd9tMZMKefexCS/GA502/Mm1SP+BnnKvS6Zybek2i16Hef1i3nM0aWxRnz59iT7sK36r5ec3/NnjvL4YS53IQ7ez90VaZWTVNH7Hlrynxa5HENewYvmXioYTtKYZnid2cevdwUnRTiLhTCEJDXrhlmaLgDY2OmkhYEO6Pfz0slqJi2xVmDLKlt8NSFKO9uh9Ut5V6IgrePS5cCNDZgzRBvUoeaB6pTqJH34UKKF/vyy/uCol5XAjqFfR4rPkGgWLtFP2xwQesgWzutSWHKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/RcOwvX6G+A6yZfYmGyj4oEr/iP4SJj3cNoYoxqbAv8=;
 b=GqCO0fWZIO54dqan6hCpxwN/9ihhn56gM5oInxLKaS2fUD5z64cTkVdcQdGmTG6AXjwg85+bJHoB6U9e0ttQvQTFoleri3lM1FDgTQdB6TC2aNHgQpCueCSUdwN+yIS+k8e1ke6zWvaJ0wD0dqiiWUdPcXx5ocNANuBM6E/eUXwWqLi3CoNArjoWfMbyQeJJxIKxwllDSlK7QQM29ejNPgELalcKYP4O0vjhoYG547/mTu5i5xB1xaQSvxvtHEebOLYkcubhm8xBc6uZdpjYMLOS9qvRcEHTElNanM2IbFHH7hQx30Nv+oMV8g9PUhmbGTuXRpplVTsZJ6kKilGIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RcOwvX6G+A6yZfYmGyj4oEr/iP4SJj3cNoYoxqbAv8=;
 b=VJhm6c0yFX08BLoPc1ObO6HAXPcyLtu5oMdTMjJQJUSKIqOJMXm4mI0GW9tz4r4BWZNius9EYXpr6wRnsF+zz4UlnqrpbKmGJLkYDmrOjabG5yj0c84Y0WyPav5As0b0+JPTx28Luieuf01ECrfY968KWI/RnXW6ygOpnFWY4/Y=
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Meng Xu
	<mengxu@cis.upenn.edu>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2.1 RFC 17/12] xen/trace: Drop cycles parameter
Message-ID: <2bd51843-de50-d442-dd5f-7fcc340c3f26@citrix.com>
Date: Tue, 21 Sep 2021 21:08:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0210.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd7a6898-e703-45f9-4ece-08d97d3b8acd
X-MS-TrafficTypeDiagnostic: BY5PR03MB5346:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5346798F7AAD2E05C7FDCFAABAA19@BY5PR03MB5346.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPWkHuSRbtT17p6JFiGs8hmT8DUkMaH3uR16yL8xvqF+fDiDc0BUIhH/ArTH5310GPA65rfemlAdpnvA4zwNkXMY1wWbUIavW+QUsGpYYC73xhiliv63PdnMfm4SK/Zk/Y8rQPPWThW4BrgcdyQD/XhSEC1etD6T02/8uqoMomGXJrADa/Apd8NwBnpQ9dSFKd3rtBnYrY11YscEDE1QC8q+SX0r2mvheeTB23X4qLEEdymdAW3izGRd1QxeOOb/ZxrVSJCj762STZ6jLejj4JG6wDH3OPIlqz0jDiuujX8NSWV7ho3YyNbJfamW9hnbHwqpOZC84sl2N8K65ox79wcPsazQTGgPHqwPA3dJcK5E+kGiYWGPcsDVBVhgReI0pV5qVr3XIqeZrwVrZuP9Eq5wcmy3frVRn8N4EgXC1lGeX3AAWIGFVOM/bVnsf+4VA+gcshlRD3T0hCoTupay54yasv1xu3yLDl5toLuXYk5ZOcJ+6af4BXw3ZiYGbWRRnQEb4PwXMr0OAVGhgIMUJmjkaNY6lNr3bAN+Slgu9K+AVp1/X8ra0yO87xwV+URxFKkp4YGc9qA9NMCJ5ob6dwAX94XEZiVSMqzE0ovnS49tzDM+Z8tijIj/6jGVve1KViYsb6+V2+KAH80XOGg0P7lyFIrWkKeu6oq2eQ1l6A69sg3gkO8lJiaLi76qlxb1SdOKo4YWBr9XJg0Tds0+Hfy9VZKnmxIjOlJAXUAblC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(6666004)(54906003)(36756003)(86362001)(5660300002)(55236004)(66476007)(38100700002)(6916009)(16576012)(66556008)(8936002)(316002)(8676002)(31686004)(7416002)(6486002)(4326008)(956004)(31696002)(2616005)(508600001)(26005)(186003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDhIcWlLV2k4a0ZiNlZSdFE4dnJjakt5a1kwQlVHZW5yNVU5UkVnV3ovWDNH?=
 =?utf-8?B?bmw4R0F0QnlIamhHSjU3M2RQaXM4Vng2Q3A1YU5uUTlxTUFFR2djaUM0ZUI3?=
 =?utf-8?B?eGpBc1J5bzhodTFjMnZJQm1EYjVrdXZ5T3ZuOEVsTFg4NnR6L1pQb0lvUHNB?=
 =?utf-8?B?bmlyNjFrTGp1Q0swcGlMRGVZai9vNFNLa0RpK2JrZnQwdVNYWDdzeXFGaW1G?=
 =?utf-8?B?K3p2WEExQ2JVL0hydUs1RjdJMFRzR3F3Y0l3ZW9iZVJheFM1STBXNWpVWmxY?=
 =?utf-8?B?eXU0Q2JWR1JyYy9HVTBXYkoxMFdraFNYaGp6V3NYNjdQbmJIQ0ZXcDJUY1A0?=
 =?utf-8?B?U3BXaWVXSjZDUXBPN29OdEZIK1E1Y3lyRXNKdU1TQnpQUitVS244cTYyYjIw?=
 =?utf-8?B?YnU1UXd1MU40NWJvV3ZOeVNvL0V6a0wyT0hFVjZKUHFEbjA4dG1HQ0hTOVBy?=
 =?utf-8?B?WnZpeDEvSUVTT3htMlhPSjNiejlCMUdNVHlWUmRiVnQvNml6VS9MK0IxRnhI?=
 =?utf-8?B?OG5SNTR1Sy9Tb1RFZFRpNDV2Nmh2cWphUWNxSUpZN2NKakZaSUFwK2VZaXZV?=
 =?utf-8?B?R1JmQ21JSWVsR0ZwejQwcEYxVDlBWkxTQUpLd3Uwd0Y0UnlRenFrMjZ1Njkz?=
 =?utf-8?B?YmJ3VDZOdFgreCtPMU9HT21tSVc0QjdmUWExMzkyZDg4VENXVFhjZTJIbDZt?=
 =?utf-8?B?ZWlvNmF4SU9VTDZzQVloRXhsNi9HblppOWhaWFNLbE9CUG01N3dqUC93dVBO?=
 =?utf-8?B?c2NXMmdRUVBJR1UxR3UyTUNjYWQ2Q3IzM3UzdTFHSG43c3JIazQxblVPVnJQ?=
 =?utf-8?B?SVU0TFg0dFczeXpKYy8wSFp3SGhOZEgwclJYcGMrcUxXVnZyS2V0MXBZQWsy?=
 =?utf-8?B?TGM2cC9palh0eE5KM252a0JjemxYOSsraEhSbngxbTFFNDRjb3MvczVsWUZU?=
 =?utf-8?B?YUNYeVdSMEVMdmVKcXVJNXdhVVUwUG5KN0F4SzMxRytHZzdaZllENXFlZFRh?=
 =?utf-8?B?TUE4NUZxejVjOHV3cHYwVXAvQmJkNlVtRk9pMW5RbXVUOExyREN6czhTK0VY?=
 =?utf-8?B?ejJldXJvdWtxMWhxcmRDRVM5WVVRNFk0N01CYWIzMG5UTFNaempJZVVrR05V?=
 =?utf-8?B?NU56bmpFdHhiOFBnNnRjRTAwQ3BHMndqZzM2U3lmMC8xVjFxZmhDR3p2MUx3?=
 =?utf-8?B?L2sxVWRDOU9hakxON2ZySXpRUTgxbE1mNTN2U1p5bktqb2tUMTZFKzFpS00w?=
 =?utf-8?B?Y3pLekxBOVZ4QXh2Ukh1VXdUTEw4czVtRGsxd0FuaFJkYVY0M1Y1SHUwekI2?=
 =?utf-8?B?dDgrN3Q1M2ljZmFyTXM4YmJLMi93UHdjaEh5SmxGUFhjSlFWMHRVTWNPLzN4?=
 =?utf-8?B?NC96MitDQ0ZvTzg1SEpRMjhXdkZKMzBLUnFZNnVML2VySi9yWnJkZFJvdzls?=
 =?utf-8?B?VStLVHBjemh0RXpCMmlvbW43NlVkemJCbmhuVUNZc2dWdStwdTgxTThJQm1Z?=
 =?utf-8?B?cG9kL3JJVERuR01TUXNhakMyUVZROTVPTzNndkg2YzNtdVkwak1xV3h0bm84?=
 =?utf-8?B?Z292OFRxdVhFaUlqUWxORTIzTnhxVktVVGxiMlRyRVB5dlBkUFFkbjJBc1M5?=
 =?utf-8?B?Kzl0djBWa1ZZZXJiM0JIYzkrOFZnSHhaTUV2cEM0b3RNU1JZczhyT1pjQk10?=
 =?utf-8?B?T1Z5T3d5NHNrZzhkQnd3QmVpalBuT3ZzV01iZ1Q4cmlSR0pVeXduZFdIeG4r?=
 =?utf-8?Q?FnccQgBiTnTJbcMteQHiv3PzHO5NUpeJSvVHU3i?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7a6898-e703-45f9-4ece-08d97d3b8acd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 20:08:13.6448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k92JiFgrsT9Hm0mfa1Klf0Nh/HvW7gzfTH/tLFYTmdyE7TJeqhAwppSOGv/8ucqdc88FbsPybI+XoBf8ekzrC61DjlxHGzexq2n3a1xgJKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5346
X-OriginatorOrg: citrix.com

Not a patch, but an RFC idea for one...

It occurred to me that the cycles parameter from __trace_var() and
friends is pointless, as the cycles bit is encoded in the top bit of the
event field anyway, and passed in the adjacent parameter.

Dropping the cycles parameter results in +85/-1029 (-944) net change.

The common change in callers is e.g. from:

lea=C2=A0=C2=A0=C2=A0 0x3c(%rsp),%rcx
mov=C2=A0=C2=A0=C2=A0 $0x4,%edx
mov=C2=A0=C2=A0=C2=A0 $0x1,%esi
mov=C2=A0=C2=A0=C2=A0 $0x10f002,%edi
mov=C2=A0=C2=A0=C2=A0 %ebp,0x3c(%rsp)
callq=C2=A0 ffff82d04022ea20 <__trace_var>

to this:

lea=C2=A0=C2=A0=C2=A0 0x3c(%rsp),%rdx
mov=C2=A0=C2=A0=C2=A0 $0x4,%esi
mov=C2=A0=C2=A0=C2=A0 $0x8010f002,%edi
mov=C2=A0=C2=A0=C2=A0 %ebp,0x3c(%rsp)
callq=C2=A0 ffff82d04022ea20 <__trace_var>


Just sprinkling "| TRC_HD_CYCLE_FLAG" over the place makes things a
little bit unwieldy.

Instead, I was thinking of implementing trace() (and a thin trace_time()
wrapper) mirroring the "new API" in patch 14.=C2=A0 Half of the trace_var()
users should be __trace_var() already because of living inside a
tb_init_done conditional, and the rest are actually opencoded TRACE()
taking no extra data.

Thoughts?

~Andrew


