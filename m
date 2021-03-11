Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656C33754C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 15:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96566.182793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKM9U-0002aw-Ff; Thu, 11 Mar 2021 14:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96566.182793; Thu, 11 Mar 2021 14:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKM9U-0002aX-Ce; Thu, 11 Mar 2021 14:19:00 +0000
Received: by outflank-mailman (input) for mailman id 96566;
 Thu, 11 Mar 2021 14:18:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0MTW=IJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lKM9S-0002aS-PR
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 14:18:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c944d42f-ea84-4e8b-9b3f-04696b20b32b;
 Thu, 11 Mar 2021 14:18:57 +0000 (UTC)
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
X-Inumbo-ID: c944d42f-ea84-4e8b-9b3f-04696b20b32b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615472337;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=L+RNroIQDEPik4ZuA/EtQGlCanyHfoXJJw62y+ltc2Q=;
  b=M6QU5H9RFJT83Inj3Vi0AUij29T1WojLo/gYOSeNDuU1CifCbTYoBR/q
   IlJrVpM/QSHj3XjdEf4XIZe2o+1/jGxdsjQJlUTmU39a0M0yBzQu6isku
   j0MngNJXsXfuR8coifp63GgLpCDiYmFCiZ5Epn7jPZINF+PETTPLDAp2c
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SnZPWjFIj1W4lQ1z2CmaHN7OtMa9Hf1OBwBwN8Yhj/KpTIgk7ydvzNvL6B5XXtBz21CsmGuTu4
 osZKq8onbLctybl/BPYqsOBdbcy4NkIoalgARyZKzQLfnzCgtgDO4bLdttyH937g5+cEtf5peT
 H5r72KGE5WgtDW+NPt6yQsGYb7aUxSQao3qEFaNfTma1//6L3us5KVqddap0Wzn7zNT5GJluHe
 vJvsPS0y+zGI8jaWHbIDsccJE8VGYg8+qyc6dtyeoAQxvCR7e8XlxxOpEtIutFN6Tnx2a7p2h6
 wnw=
X-SBRS: 5.2
X-MesageID: 38968980
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:XREfDaohlEBxgh8KoA4cNGsaV5sOL9V00zAX/kB9WHVpW+STnc
 y2gbA/3Rj7lD4eVBgb6Km9EYOrKEm8ybde544NMbC+GCzvv2W1JI9vhLGSuwHIMSv46+JbyO
 NcY7FzYeeAc2RSoM7m7GCDYrMd6fad9qTAv4jj5ldrCTpncqRxqzp+YzzrdHFeYCljKd4HGI
 GH5sxBzgDQCEg/SsigHHEKU6ziirTw5fbbSCULDRIm9wWC5AnAgNSWfySw5RsQXyhCxr0v6w
 H+4mvEz5++uPK2wAK07Q/uxqlWg9fox59iA8GBm6EuW1fRozuof4hoVvm+uik0qoiUmTUXue
 TLyi1PA+1Dr1f9Xkzdm2qc5yDQlBIVr17r0xuxnGbqq82RfkNAN+NxwaZiNib/x2Vlltdmy6
 5P13+erPNsfGn9tRW42NjSSwsvrEC9pn0vnIco5EB3QM8TebVVpYwa8FgQFJpFFiT854Aoed
 Mec/309bJTeVOeY2uxhBgT/PW8GnIpHhmHRUAeusualzhO9UoJs3cl+A==
X-IronPort-AV: E=Sophos;i="5.81,240,1610427600"; 
   d="scan'208";a="38968980"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pfyav6V8RenKi/rY0P9dqvFwCXh08PdSALn9Y/PQ7E/v7qcXwOPe+4MD4790aNquWw1tR5ZyOfy3b5VqFCTZ/v5ZLc5M1dZbC40c4+tyuas3p2cQkWMXf8hCzW3k7boUjKdyUKHkGLMTFm4EP3NF7K6fcuiAcLXAhzIymF+fN1np2MBfnutOe9RJD9SeZIBuQeC/G1yQXqyTOuUk5doBYA6bXHEzNUuGGsVA2Cn1drs6Aafh/DLZ2nnEqZzUFJXqQn3aFV31aXzjhcp1uZwQ/0Er2449nTTzzZ+ReSDR3w0tSz+HYIoLR/tzBVIgegc3+M8ld6yqC71Irc6MqSAQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZ+hrFI0aAgo8+DuTI/aKLatz8Ixaoah2LZAayXwD9Q=;
 b=oIFTNstPZEQe94dK+yH+4JziksxXuZHtnzespRyLVoTpgP2qROJOyffHs9OuTgeexlWiFevcjb4rmGG2cImIMesjZQDCP+hG37spe/bWcphFgABUlVbWOjSWiEJBwhukvwVgycgWqtPt/GgTLNl72LcapBeO6JRrUTvHbNUh50cJ/KMR7KecuE/RLtW7Gxbe3Zpm4+vGf2YM8lBYFo5e/sdqLS9RIrxeY1DyRrCMqwJ3zQQCtjWHQy1fOOxe+T21NsCPuUi20c8PLfwArTTzjfCH5nIO7PGHpICjqA5UxM+R1XFvz9AwxbcDK9SekzEXRbcsEjypXwg5Ajn92mf+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZ+hrFI0aAgo8+DuTI/aKLatz8Ixaoah2LZAayXwD9Q=;
 b=n9JNy4EMG7fWI4PIZ4AH4vC/UOaCe/RBkRQxDzhOG24Fs1su4UvVQ+T2xlsCx0j48Z71JeMCkPCp8nD1afgITqVTxy1WfB1UPjAivnRQ3qMQjBr8msFE99GjKJdykcFvVpRzfQjK1ISlnBZVwvm7pNFXJuLi/G8NjGmHoc4X0eg=
Date: Thu, 11 Mar 2021 15:18:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
Message-ID: <YEomtoHmq7UH/P6T@Air-de-Roger>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
 <d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
 <13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
 <556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
 <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
X-ClientProxiedBy: PR3P193CA0042.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fade3d81-3cb6-493d-7fc0-08d8e4988f34
X-MS-TrafficTypeDiagnostic: DM5PR03MB3145:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3145778CF036AFF97F01A3738F909@DM5PR03MB3145.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MvTADjTcmVaK/jXFm81Ex3cThkbLEf1J3wR7Rc8K2q/wR7oEPS5tr083WeEg8n5carR/PI5uPHpd0dQrQQWktKibf5yGUm2ON/Q7pZKppHkVhIs32bxTytwooxa/YKpC+9FT5cNv7MtAkTD1OrQkTHpT5eI9Qho2FYuTLuxJe1/aJ7SvAIRmGM53S8zQ6+RJ83ccLdMIrOH08+R51XeYP93FKDYkHaJebOMB9Bptxzpc9FQgb5mNHrJ9E11Pk3NAFgWfE298vLXOw0nrj3DHPYWxae1eBt+h8jInn4TTAgDBgRwKOxQaYs0PdoaxOhrM5OdgX47V+3BCxA0lqgwtfu1gqrsqN/VBx/IVUVnf6dJ8bfSct5WfAY9wumCe998yIGBp4RNEg1g+AogMYYtPpv8zPCQGJqjW6ZZiyXWREkHPJbStD+Fmz26TXJ54vKgM75fWcL5ra5vndQJyGtjqFqU7ohiho1xY8KkIA10GyLw2I4gPb1ZKOaKLNLGUOjE9YlfsFzoB7Bh4iukMWW0M/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(83380400001)(6486002)(6636002)(66476007)(956004)(16526019)(186003)(5660300002)(8936002)(54906003)(66946007)(4744005)(6496006)(316002)(53546011)(478600001)(66556008)(2906002)(26005)(86362001)(85182001)(4326008)(6666004)(6862004)(9686003)(33716001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MCt2QmQwUjYwLzUxQStXNlZxSXB0YUc1OGVtNWxTUXBaN0FpdGYwZWY3TEEx?=
 =?utf-8?B?UTZzZy81UE9veHVURkZSQ1FRT042VjZOa3ZKcnlTNTZtMHZtZFJGdHJMMnpR?=
 =?utf-8?B?YUNIbGdvSE13ZmRXdEFOcTYxWWJ5RWJtZXNRVENHejRNODlwNXpaUjAzeTgv?=
 =?utf-8?B?WHJ2bzNlL0x4OEVmM0h3aWtzbE5wdEUreFZBb2tGeVFRUHlVSkF3SjJadldi?=
 =?utf-8?B?VVZnRUdCcUVERkRBSFhFZWc3cXB0MnBERWRTOUx1KzVvZ0FQU0dyWmNHeUhr?=
 =?utf-8?B?UktweTB2WVc4S0Q5VWNmblNMbGc4VCs0aWFsdU9yOGQ2UDhjRFdab203ZmtV?=
 =?utf-8?B?U0xLTXN3VS9SQWlTakZiQjlWQWo1ZjI2Wmp5dmpRTFZ3eHErMEkxRUx6QmpD?=
 =?utf-8?B?OEhLTVFkeWs4WEhrbjZjTjBjcUExWDMzYnNJWDl4MUt4NGZKOFN6bTJUUzBk?=
 =?utf-8?B?QThwMlQzZm9kaS9QaG9FOGQxcFd2RzA0ZVhsbGxXeVU0S2pVMVZqbEV5L0hQ?=
 =?utf-8?B?NEdwcDNwUWMrRjFtbWFnWEtKcm9Db0t4VjFBSS9VdHhUWDhDV0s3alZ5Zk53?=
 =?utf-8?B?NU54d09naktVOXlmNHZaTG84a0tqU2dFaHovTmFOSW1QMmp6ZXJ6eHhQOFo4?=
 =?utf-8?B?ZG1GQmRicXVqMUZJQ2h4MjhnclIwR3RKZmduUG9NcFNuZnM3ZXZQWjVyeVcv?=
 =?utf-8?B?SjQ1UDlCWml3RkFZT3VVY240clR0YnNobGhqYk96WHpUd0ZtZXpGWlJUUWhZ?=
 =?utf-8?B?a2tGTXpJb2pYaUo1MmFnQzZidy96bzdYNnYzN3JtQlU0MDA1UXBkeW1WZUll?=
 =?utf-8?B?TStaenNFWGdWc1hNN0Z4TUt1ODBNb1dBSEJESjhPZ3k2WWFhUTFhUW5VMzZL?=
 =?utf-8?B?azhLakZxdG5ENE5vWFd2dWdSNndSWmM2YVp3eURVak16OXRLMzlHaFowbjJl?=
 =?utf-8?B?QWJvVFllaXd0RnVzaTM5Skdtc3UweWN0SDZzUW9obkQrSnpCMC9Sb2plNDht?=
 =?utf-8?B?dGdwcWpvb2ZGRFJwb2NwbHRPRTRSS05KdlZYL2xGRzltWjl5VnM3SjR0WHpv?=
 =?utf-8?B?ZzJkS2l3ZE9HQVdrSVhWc1FMdmxiR0NPdnZOaVRtbFNKWmJ2bHlreXFMbGpG?=
 =?utf-8?B?MEg1ZVpHcEdFdnU1QTF3cHpxTU1wVWhQdXFJM2swR1JERTBSNjV6ajBGdEpa?=
 =?utf-8?B?dG9Oa0VXY2dObEFTWTNWbjVRTkRlSnk4Ny9abWxCUkdIK2ZXWC9RNDFBSzZF?=
 =?utf-8?B?UmtpVkVlRXEvSTZmemxJN2laYzJDcjB1U3I3VVg3Wk92UktpS1FTWUVVNENx?=
 =?utf-8?B?a2ZJTkRJNFA1VkpMd3JOY2VvQVNMN2JQWGNhTjJSN042N2JUZE9KSTFUSnJY?=
 =?utf-8?B?cm5ZZTkyUWVSWThVSkhrOWVaK2drNnFLRkJzdFRObnk5ZVBJbytqWStkajNl?=
 =?utf-8?B?c3YzSkZYUnpyWXlPaVVOMTU4WFVwSmVibEQxWmpKbWtFcnBxRnQ0eXY2Z0pD?=
 =?utf-8?B?Ump6Y3ZZanVTaTd4VWFPOU8vaElYeHdNT1cyVXMrZWxaVi9lb0ZnVEU2a2kx?=
 =?utf-8?B?eDlHSEh6MjBGZTFEM3BhTjIxbzVDTC9RRjV6Szd0U2FlK2llTFFsS1d5RGVB?=
 =?utf-8?B?dytKMmJyQzZpN1BmTmJFVUQ3Y2dodEFQdVNyazRwKytrQWNpU0xPSmZWQXZo?=
 =?utf-8?B?WkpjS2pVV2RMa0NHZEl0TzJDUnJuaTlTTnM2bVZuQkVKYWgwV3IzRnVJOVZ5?=
 =?utf-8?Q?vUDRO43hLO11JVUNWpgw7oIQWdVLWXcd6FA1GDa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fade3d81-3cb6-493d-7fc0-08d8e4988f34
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 14:18:36.2943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9I4DgSesbtP11t7078rVyQfIT5fGzICwVDNY43fR9nlFwn536FrZ96qRZWHfSQbJDv4dFU8IfSrQHyz56pxMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3145
X-OriginatorOrg: citrix.com

On Thu, Mar 11, 2021 at 11:05:32AM +0000, Andrew Cooper wrote:
> On 11/03/2021 08:27, Jan Beulich wrote:
> > Depends on what __XEN_TOOLS__ really means - to guard things accessible
> > to any part of the tool stack, or to guard unstable interfaces only.
> 
> As far as I'm concerned, __XEN_TOOLS__ should always have been spelled
> __XEN_UNSTABLE_ABI__.
> 
> For better or worse, the fact that we currently do have unstable
> interfaces, which aren't in an obvious namespace such as
> xen/public/unstable/, means that there is some value in some form of
> protection to prevent users from inadvertently using an interface which
> will explode on them with a mismatched hypervisor.

I think using __XEN_UNSTABLE_ABI__ would be way clearer than
__XEN_TOOLS__, or even placing those in a separate directory as you
mention.

Thanks, Roger.

