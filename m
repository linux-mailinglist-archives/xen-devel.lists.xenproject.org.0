Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2586D66B4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 17:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517953.804003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiDF-000784-IK; Tue, 04 Apr 2023 15:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517953.804003; Tue, 04 Apr 2023 15:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjiDF-00075G-Fb; Tue, 04 Apr 2023 15:04:45 +0000
Received: by outflank-mailman (input) for mailman id 517953;
 Tue, 04 Apr 2023 15:04:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b6be=73=citrix.com=prvs=4510202f8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjiDD-0006cY-I2
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 15:04:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05f58427-d2fa-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 17:04:42 +0200 (CEST)
Received: from mail-sn1nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Apr 2023 11:04:34 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5598.namprd03.prod.outlook.com (2603:10b6:a03:28a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 15:04:31 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Tue, 4 Apr 2023
 15:04:31 +0000
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
X-Inumbo-ID: 05f58427-d2fa-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680620682;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=igp8vhRXqLzi6dgIlBWd0iZCPWb4KnQmsCPvlHrRiqk=;
  b=eioSmmy8ZGpEcGI/xJrHVL2RHJ51Zs+ko5+0S0Xl7wC9HgLxbmjsUJ+p
   BXcDdQUl2fU5pjwkWl0lrzo1wzAUH5XA2KSFWyHajUYm2SS5mUCs8m66L
   8CiS+C/JncpoXjwS3Bb1ySGJR7ixWw4xVR0GvO9bkefb7AP3YE0W5XtoY
   Q=;
X-IronPort-RemoteIP: 104.47.57.46
X-IronPort-MID: 103079324
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xDo0HKKNRu6hUnKtFE+R9pQlxSXFcZb7ZxGr2PjKsXjdYENSgTVWy
 TQZXWmCM67fM2qmLd90bN7l9BwDsZ7Vm4c2GgRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRiPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5zGWZB2
 tw9MwoPTTCIt6G0kJCLYeVF05FLwMnDZOvzu1lG5BSBV7MdZ8mGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dopTSNpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyr33rCexnmnMG4UPIaBptI0knbU/X0WMw8/eEGWoP6Tj0HrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAmZDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+pQSiaPCEUKSoZY3YCRA5dud37+tlv0FTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRP+ZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:EWHwRqoO3mHraeV0iCd3j2AaV5oJeYIsimQD101hICG9E/bo8v
 xG+c5wuCMc5wx8ZJhNo7+90dC7MBThHP1OkOss1NWZPDUO0VHARL2Ki7GN/9SKIVycygcy78
 Zdmp9FebnN5AhB5voSODPIaerIGuP3iJxAWN2uqUuFkTsaEJ2IMT0JdzpyfSVNNXB7OaY=
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="103079324"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zep+hn5yw3NA1jJHq1tf6kXrYY45O8INcCRz3PgUYawe2hIl5bbZfvzjeEgM0JNNJIrg8awLHkpdrN5MDrlr0rGqDtL1yedDV7ecWCCu8sctv+WMUc7wAjO1+pJetJOnVX4zvuqvMVZm14cKTU9NzXEkJvD67l1WSTtR8jQT/3l5t3CZ/P98CSuUYli8AcpiXZxOPjf/GZElTekluiUBMqooAQmVB6lLjRpbMKrU3qvd0Vf0PRn7e4i0h1R7Y9BAnlLhBYhMDaIgAFeO7zQVjjtKwRfaav2+1O+ayIKETvwSR1N6msfuoEdTuyd7xhIXgatujSy2wG2WbImoH2SjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAJceG8SYRB7dmczQIz9NoKmgKqs2EQZOu9yMBGtoAw=;
 b=lCH1Z81IlhvjG1CmJLos7NLbWThErhel9E0JUo9j7JXZw7iR1oRZv2bw8dAY4Egc7xCeec9KbG1bJCPIjrpoZnCfiadBA/wADOgYJXAS74U7jjiRKreLjccJRxLBEmompdQ3Ux/WXtdYef8Cj3kb//DYchPMr3Wg4lYr2CrWc7B0UDqN38E0p2Dm8qRjQON2FUW7tHfTTRIe/nA6RAw42dZ0rLU1kYwnQwY3VSoY0v4kxAcVBapm6P2CH3r/kzWQDv4i6AoP8lZkaEQfFHMvXmflgLwCL32/Ht3TRkTS8C4QsuyRq7/84E/Ij64LaZnPDjhQrVBu+nNd3OElk01gGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAJceG8SYRB7dmczQIz9NoKmgKqs2EQZOu9yMBGtoAw=;
 b=SKzQywZPOCsvd/BQswUJk7wabPiUfz762Nqii8wYcsOXkW7qn8WWVZdZhKRUaDAE4Gz234ayWrDFuTFh6e05r1aAsiTJ3pZCz/J2Y/1zt3QyyA/0KGqps/70ZqDqW6+1Nt24HhIX4hCe1TT5G7PfClCZ42bx9H/8X7DiEzU7ijU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Apr 2023 17:04:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/pci: Correct ECS handling with CF8/CFC emulation
Message-ID: <ZCw8eQSIN0FpXAhX@Air-de-Roger>
References: <20230331175719.500285-1-andrew.cooper3@citrix.com>
 <ZCqVEHe1Qo3skeVf@Air-de-Roger>
 <4b76def9-9940-ccf0-8050-12ddf2c1253c@citrix.com>
 <ZCrUErZZkd6co1Dq@Air-de-Roger>
 <91fc0c1f-a985-17bd-2011-f4964d82e008@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91fc0c1f-a985-17bd-2011-f4964d82e008@citrix.com>
X-ClientProxiedBy: LO4P265CA0219.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: 719450aa-12ce-42a8-2a09-08db351de4c4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wVy+E1AH+Wl65p+WGY44c1JsWBvU/R07CFxP/Lhwfb1/hwSDm6F3N8mvYC05jHJRFhJ76nVcZqtjhW/ELWMDZ9BFALVMt3HS+qBsGcGy+/CQX0DmPeBZHMPRiG/G7t2CIUp8h3rJcIg4CKJjnzLqwqasCc8C0vWVDqXU7A8Kzb9rj/55iwbaOVXrAF3cjh7SuNKVwnAUZqVUyv1Og71RgzgIUuk2HyDZ7sfp/wdtrNTAwuDS4qapqkqd7qizRmPc9s2cOam+A/+FG3UQ2erfk9nZYFetsbYNKTpZIIwWxmUlaZsj6GPe66vmfQP7PCJqvdZy39J4QvTv8jEPQYCB/sNuFoBigT7+3GCN98U65mhLrVytpukhydvRSMFrS/RgIfF3eNOqYjv7abqQXSKkGexkm+Tjo/rLKAKd2KosAw4ZD5sZzs1aqORMYcm0cl6zr2swBfgzYn3bET1pfANAdsq/fvagkEsNl28f1vK9nlWRXNOuAO9KQRhsSohOl8St0zIqLoIeN5z4Xc/TzstgUW+FGK+DW9HdfIKza+y8+CfmkiimmsajzwCqDFLqFsZA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199021)(186003)(53546011)(6512007)(26005)(9686003)(6506007)(66946007)(38100700002)(6666004)(41300700001)(6486002)(83380400001)(54906003)(478600001)(316002)(6636002)(33716001)(2906002)(86362001)(82960400001)(66556008)(66476007)(8676002)(4326008)(5660300002)(85182001)(6862004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2MvMFhNS2RCQ0ZpQ3ZCaExNZVFoTXIrUkRrSFBKMTdlbUVNMTdqTEROTWMx?=
 =?utf-8?B?cHVjRE8vcHRMWHA4RDVRZzdFbkdBN3J5K1VGSXZCWUxHTE9qbzFFNCtGVmlj?=
 =?utf-8?B?U2lPazJPdVA5dW1iTG9hQm91Nzl1OXFrZitaMS8vSWtia1habEdpdnRjd0p2?=
 =?utf-8?B?blUxcWVFSEFLbTNtY2VjelpRMVVobTcxSUFWemVTYlozRjZSVEhIanpSaUx1?=
 =?utf-8?B?SDFYVFdKMVBaVEhXVzFSblJUTVF0eUFHMnNQdDZUY2JUa1RVTlV1WlZncVlM?=
 =?utf-8?B?MGNiVFRSbDJDVHdNWUhzSFpyOWxjalZLZ1hsSnBXcnVyWW1hUHFtZlRGT2xQ?=
 =?utf-8?B?eStMUElJRXRRdVdIQ2ZPUG9ia0hYaURwQktJeTc1Q1JDSVFCcWZoUzNSa01P?=
 =?utf-8?B?RVVjbW5EbUN0T00vcUYyY2ZyVkNsd1kwMGw4VE1rSVZXYll0bWcvb0FqTUJG?=
 =?utf-8?B?SS9Xc1BBMElIbDBxU1l3OGhaLzNVMEpjb2x1VS9hMGdxT2NHdVBGQVlNMnB5?=
 =?utf-8?B?ajFZcGpPbVB5M29pR21zRW44czZaS1gxVmc1K1ZINTBOSGRPMk16dG41TGkz?=
 =?utf-8?B?ZFlWNGwyR2c1QUdrN0ZGTjYvQTNDKzUyMURwR3VCYk5UZS8yaEtVZGlrWjBP?=
 =?utf-8?B?K1U3UHUvNUFWdEFBdEppWjJYTmhHSHY0K3pzSjlZK09xd0pRNG9sMUxERUc4?=
 =?utf-8?B?RXRxT3AzSllRTmxvRWxMQk5wS1JENlNNQkdYRDllUVc1QnVXRU5TdnJEcVE3?=
 =?utf-8?B?NlVacmdjWkZ4QS9DZG5VS1lBcnBFaFQ3aDNwclBCbExKTXNKQ2Y4cVdIaTRW?=
 =?utf-8?B?T2thVTJWY0t5QWs4YjhiRkpYdmJvVGZBVHppeTZKOEtmVE5IZHFNWTYxU2Fl?=
 =?utf-8?B?N1QyQWsraWtja0o1TnBjRlhyR1UvdGJCRE8wb1JkT1lmRUg4TEY5d1BneG5U?=
 =?utf-8?B?c2ZXWVJvTEp5SVV5bU1PSkx0eGgzby9tVlZMOVlRdTJubXlIa0IxWGxTN3VU?=
 =?utf-8?B?MWxyK3VvY0FMU29ITFZ0T0pleEQwdkFwcXNENk9pTEk5QjMybjg2WE1vaHJE?=
 =?utf-8?B?by8rbDFPaWNYV1I5QURleGNhOWdzMmdMVjRkNng3bEtaSzdVUHJxdlBhRzJ1?=
 =?utf-8?B?T0VyWHByZWI1Qk1uQ1h5aXM1K1lPR1BsYVA4TUpiTE5nUmFRUEtqeWhDeGdV?=
 =?utf-8?B?amRJbi91aCtYWW1nY1hMaVZqOEdMTnZxWW9tL0tRMGNDdjhiZ2tWUjQvWFVI?=
 =?utf-8?B?NlBRMkZ5aGNuZnQvNGU4bDd6dENHZ1ZnYWhjblNnOGxqZ040Z1VSdVdZWkU2?=
 =?utf-8?B?cXkxWXFVSStGbDZtYkgraXExUEFPS21ieTcwRjZNcnUvZWdUaWVubnR6Z0FC?=
 =?utf-8?B?M01CSHcrZE5VZEszdi8rN2Y4Q1kzamRjK25FVmxVaERwWUJ5M1hDVmFNVmFP?=
 =?utf-8?B?dlRkWmdqUDIzcnN5cmQ0RUhVekZwVHNHa0lnWkxSbElWWjdWaE9oQ3B5VFo0?=
 =?utf-8?B?Qk9UVmRrNUJlcXhaOGM3ZkM3bnFQR05JYlN0VHFiQjNhNU1BbCtQYllwRGZX?=
 =?utf-8?B?RjRRK3p4eXBRQWpPSDV0YlJmd3IreENDY0lhUUd3UWhOOHhUNUhzcitKTUVV?=
 =?utf-8?B?SkRXQVhiTjFMU0JuN3pKU3JRUzRJMlE4OG5GQnQ4b0NidzlWL0RyelFRRW05?=
 =?utf-8?B?RlRzOU8vNGdidTNEOHVPZHozZjNIZ3dtNEJMZkhGYUV4V0hjcWt3MXp3elFy?=
 =?utf-8?B?MVdKTWVqZXJ6eENIUTBxTVpNZUtQU1FQUHJnWUJ5VVVLWW5OOHBJRzZCRmQ5?=
 =?utf-8?B?L3dzbEkvS0NSYUZXZUJrcDdZWWhMZlgvbmVCRHlybUVZUmQvdUtlSHZGUjR3?=
 =?utf-8?B?dE9iZlFQTElZcFdaMmQ2eEIvQXlYMlJZamU5Rm9SdWY1T3V2dmVoS0VhblQz?=
 =?utf-8?B?d1dwNWdsZmRpRk5IY2MzVjFHbzdjemdpbGEwYWtQWUNYdmhJd1dDdjMzRzd6?=
 =?utf-8?B?akhKN0c2QmZ4QnFmS2lTUi9HNjhPTnlmellTa0tMY05rK3RpblYycU5OQ1Vv?=
 =?utf-8?B?TlR5MzduUU5WYTdHNDhWaFd0VVZ5aTA4Q1VxVVcreXc0QTBlanBYTU9oenY1?=
 =?utf-8?Q?oXXBCMv32Pfi+2nteoDxkXlM1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gG5XgOYqLzVRA3Dy19jxDPS8VVaXE3vZAH3V8sk0tgmKzD9p1sTOqAlWB1GWVpPQpnCTAqMrCRtO02JU/Btj+L4w+LY8czWB+cx0jvfIXovmW55A5KYoyyauyNIb1H0FSenkWyMK7o+kJVaCGL0Mf8Qkw9KX+Swdjt/PyNui9CiSgKHsCCUgH8I4KDwAY/i7+RQW+D0HjLYNF3OD1acd/CzA5JTdbnEa5TVfIQ0wAMhZBx3rbVuFd+Ydqe3Y9x0Zx/+mB6DTj/soLFu15vL2lBiThyXYShKXomjuSn2pMHOTnub/q6tynFSUvj7if9n65XllOhLI7AHIjzAK8Wft3AzxnTCXr+MHjLT5zpqFm7h1LRNm6b79FuD+mtKflyAjlMiuLPMv7eNrRgNGojFQ3qHNVTBBh8pkyVhApJNGaAvBH5ilFKNhj84z2neTAYBmWG1eaxPCw73k6OShprJiDnCwRfBVSr+GzFE3A5UEqbpPWYFvCliYGh6STX5GSagCxnhwSArLcOJTYx3RF8zqUhEuWovUfVj8gP3gOKLztD6PaizqPeqhwyQnwunMibt/wX7WbXIR6CsrsaGOLM7xRLQVJsdCDba4UVrbW3dN6NAaxBG/eKdhjeLEDGWj1RZ1OTlhgwGnMMn1QjG2CMebaPBIAzF3+uUfptwvRmiCjMhAb1uAdOHZHES44/v1GuV9p5acQkW4hTetdjxlPVJiQfiAaeAKr72xTzS6LmpoAIAhy8F1GPRUuVAmAWO7LunSn3SPO+eYH4oR4E4ixRiLm6c38J5WM0rsmX8Ve63g+t3SEnz9AZDX4+6eTbgeUH31
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719450aa-12ce-42a8-2a09-08db351de4c4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 15:04:31.4982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3osPg+CdPmys++u/aNnauMQ4HrG5VVT8Q0JpjMYjUGpd58t1OHxX4YF1l7BMoyRGofzx9YmJJPdIAoBh/s6y3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5598

On Tue, Apr 04, 2023 at 02:27:36PM +0100, Andrew Cooper wrote:
> On 03/04/2023 2:26 pm, Roger Pau Monné wrote:
> > On Mon, Apr 03, 2023 at 11:16:52AM +0100, Andrew Cooper wrote:
> >> On 03/04/2023 9:57 am, Roger Pau Monné wrote:
> >> (Quick tangent...  Our PCI handling is currently very dumb. 
> >> pci_mmcfg_read() returns its value by pointer but the callers never
> >> check.  Swapping it to return by value would improve code gen quite a
> >> lot.  Also, when MMCFG is active we still pass BCS accesses to IO ports.)
> > I wonder if it's really preferred to access registers below 255 using
> > the IO ports, as Linux seems to do the same (prefer IO port access if
> > possible).
> 
> And see how many attempts there have been to change this, only blocked
> on untangling the IO port mess on other architectures (a problem Xen
> doesn't have to contend with).
> 
> MMCFG, when available is strictly preferable to IO ports.
> 
> An MMCFG access is a single UC read or write, whereas IO ports are a
> pair of UC accesses *and* a global spinlock.

Right, I know it's better from a performance PoV, but didn't know
whether there was some known glitches for not using MMCFG when
accessing regs < 255.

> >>>>  
> >>>>  #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
> >>>>                          || id == 0x01268086 || id == 0x01028086 \
> >>>> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> >>>> index 5da00e24e4ff..008367195c78 100644
> >>>> --- a/xen/arch/x86/pv/emul-priv-op.c
> >>>> +++ b/xen/arch/x86/pv/emul-priv-op.c
> >>>> @@ -245,19 +245,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
> >>>>          if ( ro_map && test_bit(machine_bdf, ro_map) )
> >>>>              return false;
> >>>>      }
> >>>> -    start |= CF8_ADDR_LO(currd->arch.pci_cf8);
> >>>> -    /* AMD extended configuration space access? */
> >>>> -    if ( CF8_ADDR_HI(currd->arch.pci_cf8) &&
> >>>> -         boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
> >>>> -         boot_cpu_data.x86 >= 0x10 && boot_cpu_data.x86 < 0x17 )
> >>>> -    {
> >>>> -        uint64_t msr_val;
> >>>> -
> >>>> -        if ( rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) )
> >>>> -            return false;
> >>>> -        if ( msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT) )
> >>>> -            start |= CF8_ADDR_HI(currd->arch.pci_cf8);
> >>>> -    }
> >>>> +    start |= CF8_REG(currd->arch.pci_cf8);
> >>>>  
> >>>>      return !write ?
> >>>>             xsm_pci_config_permission(XSM_HOOK, currd, machine_bdf,
> >>>> @@ -1104,6 +1092,11 @@ static int cf_check write_msr(
> >>>>          if ( !is_hwdom_pinned_vcpu(curr) )
> >>>>              return X86EMUL_OKAY;
> >>>>          if ( (rdmsr_safe(MSR_AMD64_NB_CFG, temp) != 0) ||
> >>>> +             /*
> >>>> +              * TODO: this is broken.  What happens when dom0 is pinned but
> >>>> +              * can't see the full system?  CF8_EXT probably ought to be a
> >>>> +              * Xen-owned setting, and made symmetric across the system.
> >>>> +              */
> >>> I would assume CF8_EXT would be symmetric across the system, specially
> >>> given that it seems to be phased out and only used in older AMD
> >>> families that where all symmetric?
> >> The CF8_EXT bit has been phased out.  The IO ECS functionality still exists.
> >>
> >> But yes, the more I think about letting dom0 play with this, the more I
> >> think it is a fundamentally broken idea...  I bet it was from the very
> >> early AMD Fam10h days where dom0 knew how to turn it on, and Xen was
> >> trying to pretend it didn't have to touch any PCI devices.
> > It seems to me Xen should set CF8_EXT on all threads (when available)
> > and expose it to dom0, so that accesses using pci_{conf,write}_read()
> > work as expected?
> 
> It's per northbridge in the system, not per thread.  Hence needing the
> spinlock protecting the CF8/CFC IO port pair access, and why MMCFG is
> strictly preferable.

So just setting CF8_EXT_ENABLE on MSR_AMD64_NB_CFG by the BSP should
be enough to have it enabled?  I expect all other threads will see the
bit as set in the MSR then.

Thanks, Roger.

