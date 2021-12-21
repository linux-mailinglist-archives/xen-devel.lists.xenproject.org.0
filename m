Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C964D47BF61
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 13:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250374.431246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdvL-00084Q-1G; Tue, 21 Dec 2021 12:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250374.431246; Tue, 21 Dec 2021 12:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdvK-00081s-UR; Tue, 21 Dec 2021 12:07:18 +0000
Received: by outflank-mailman (input) for mailman id 250374;
 Tue, 21 Dec 2021 12:07:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzdvJ-00081m-DR
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 12:07:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89ef0107-6256-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 13:07:16 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-6YgIRr7fPmWGGrGG3GPwWQ-1; Tue, 21 Dec 2021 13:07:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 12:07:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 12:07:12 +0000
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
X-Inumbo-ID: 89ef0107-6256-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640088436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mfZxYsWRRdlYuHi+05rZkRMBmpXtwZWL4iHppnN0jwk=;
	b=cKysdO14tZq9OaIc4clhbx5j3zG3l2LTl5QzTmFbbXmq1qyYg2eElfkVlTjfmrNCJSX5Nq
	8KyigkEzpwHYwxTgXQE/WXw/oMkLXdgJXU6jPTVDm/YWHJF77iA+Oo3oX7FOXVFfLZbVuQ
	hPTByfRP2fYy1DTvvfhf11uYHzx8I3w=
X-MC-Unique: 6YgIRr7fPmWGGrGG3GPwWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/OPWsT2x0b5Pe/iram4YChU0HWxlVSXL/GjtS8gdY9QRbIR6Fze6DX0QDQ1i2ApKPF+4qsjQCUhzcsVesxMSZJxkBIyFGW1h2x4JjMFisEcHC9pRQlF+ivUCfd/dg0HizfnusbSOH99kwPeYH26xrgsq2UEVp7dvo6es+s+MDCHJCon27qxTxfMCV26MmBy/ais7pU5mT/+iq6ZwP2n6RpTk+Am51yBSru51zWpoZbtX0dYiTJkEcj+OUYF9ggQn9TtJKYnwB8HRVP06OC5zGcN3RiowxyhR4Y4WV93b2Uzz6b6FsCk3g4/maGsakfhqVlcUWSApK4ZVyZrxvDE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfZxYsWRRdlYuHi+05rZkRMBmpXtwZWL4iHppnN0jwk=;
 b=hPsxeetZjIEqxZwucspTEAZWlhmY+dDzHh+JjbFEaRnzA3Di3ZBrvNGTxWEnFGjVG3ZGFkvBCNwjxvHl/gbbWYvRPVTXQHSecrVcaz+LYd5Laypw8YgKUWRhpehkb4dCBzMjtZWndQyhkENo8PcFDFrjJSrIrKeEqRQSixhqGRsnOjESopyAfMPD8wpl4YML/VpMwqMStlCjkjiRo/GHvdfsrbIo2gW0mkuUh8s208s7aZ9tC+DjZF2q0deDTeJixd1R9rWGgI3hhOJi17yR05VmBajcsjWWWF266pncG86tYb6T19m+6RCQDtIDtw6DVEgfUGdREpNMEOx36iVHMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61a75382-eaf1-0e3d-fdcb-c9fa570cc735@suse.com>
Date: Tue, 21 Dec 2021 13:07:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 5/6] x86/pagewalk: Support PKS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
 <20211216095421.12871-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211216095421.12871-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0016.eurprd03.prod.outlook.com
 (2603:10a6:206:14::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 855c3618-57aa-40c4-58e3-08d9c47a6bc1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24454A5505D382B5C4FD4A26B37C9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	98+W0hr4Jc6GsWg093T6JT2NHVU9w1OFsoGfVenfcsa+UIX+4FFlXKSsKJTJxFhMyP2P53hIR8xbIOxkgRFRY4wdnA5NQ2HDZ1DI4q/VptJbyJy7IOWZh1DrjruoOkMMSCeSrBH2JmKN+Aiw6jLGgRfJP1rb7TmIxuowA37YJG502HOkXY9x9lTIjyrTd8q6a8dbyj7Q7PrAN+qKzIAgFlFmKKw8/hOPmMcWy4qIN+yi5fC+WZbGxQGtSONzPpg+UiC3MmL/wkhx+YFv5S8NDnSFC8I36We4v4msA8b1Wa5qXYPQ2oOvyoSOCcnh4MecsX+Af3dsCEUkQKgUyKlUWXyV+M7mHWl/Rdmuv+betyt2uBrnitYbtiIr2zq+v/uqAo7sF4ycp/5oa6+sVtTJTQIg1z4POX0KcJhbnu1bAsFay+rBbSikmdUlNWQ6o7zhvhnJied51/MrAUkV/26qpBzAL67sU2gw1SAYeepzML2/Wxqw4nSxGRFOAwtFt6Qc8YxIojmD7xyBh61V4EvM10/oOOAXme/pwr7jP4OySiIietWC10MrtlZjWviTTm41VqY3cwDJWhOkaaa23kLIjPwo8eDMb78p+GfI1RzgKYJD/qeDhZq4b/zs8IdnaYQkcXbkGJDt5vjr5d6uQ8wAIiOAwls/ou5XaeLmBoEAAfZDtrq7seEfl6SUyzQCSGu0XSfQXFLqNzU/Q+qu9hy95a28S8JkA1aNHh0/f9MY8YaAES7onbKzm2byZxn87klw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(54906003)(2906002)(558084003)(4326008)(186003)(53546011)(8676002)(8936002)(6506007)(316002)(26005)(31696002)(31686004)(5660300002)(86362001)(36756003)(38100700002)(508600001)(6512007)(66476007)(6486002)(66946007)(66556008)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGFDVVZzZHJ3cThUdFVQVU5BYnZqcGJZUWxzRzh0TExrOHV5N3dUTUFWcUht?=
 =?utf-8?B?TjlXNEN5MUxYVXlwcWlGSFNjOHRDMVhCYVhKQmg3VmVKNS9xNkcydzFJZmow?=
 =?utf-8?B?S2NseHlmK204VStjZ0MxN2dUQXp2WFluVVBRWVpKVjdGTndyUFdxUlRBbWlE?=
 =?utf-8?B?SlFoNSs0cStGMGRTTmUzelVYY0dnbDdoV1JKazFyZ2lhWU02QTRNSU5qcTVO?=
 =?utf-8?B?UVlKK1BIdnhZTVVGQjVvcWZpTVN6ZEp5Q01KZEpuYUhNSWtqM2podVJSN0Jh?=
 =?utf-8?B?MkVEWVRJS1l3RHVOQW1pbEtIb1hZMVNEYXNEOHpwZFB4NHJNZGdxVFpkZDlS?=
 =?utf-8?B?NWZBcWVNR2t2cWdkam5mVEd2YlBJc2dNUmFGdWxET2EyRzVLL2U3WTZBT1Fm?=
 =?utf-8?B?YzFXWGNsNW5EZG1QeGJyd01YVURmQ3VCdktMeFNkU3hLWGxCWmpqNFQ1bkdS?=
 =?utf-8?B?dWMrQzRScm5pd1Q2eW5YSnFBWTBMZm9KbmNPejc0OGpwSUMxK05zb2FvQnNH?=
 =?utf-8?B?YkRZTmplNStYY0c0Zy9mS012YnBPakZVdGZaUlJXR2x5bFJsS2hNcEpCMUMr?=
 =?utf-8?B?OVdtQXAxc1AzcUFDa3JpT3JvaldTQnY3eVZxZGpFQTlvQVhEV3daaWZhcjVt?=
 =?utf-8?B?RXEvQnQrc0pOejAxSllSVHh0SHdQWUU0dWg5WWtTemp6Nmh4QW85WU8vYlZJ?=
 =?utf-8?B?YU1wOURJS1RCd1BOcGJQTHovRHVmN2lYMTZKdHhpbWI3WnpweHFuRFZPN2Rl?=
 =?utf-8?B?R0doalA4LzJGUGswTjI4Qm03ZlRwUnZ5M2ZUNjB0OTNtbDFSR1luZ1VZNTBa?=
 =?utf-8?B?VWljSURIUmlBMzQrNTdGQk5XYlVuMDR2dUp1cWtZbDg1Q0c3ZHgvekVMVDUw?=
 =?utf-8?B?b1F0eXFFZGdIWVZJdGduU29nVFBob1orRnNTR2RlSGVNeHE3cjg0TUNaaXpn?=
 =?utf-8?B?TVZvWFFBL1BwSWpiNVhzaUhCSHlidEZSUXNjK0lWZm9wSi9LMnIrVlNCd3RP?=
 =?utf-8?B?Qm5ZS0I0SnNpV2dPaVB4S2V6TytvcGdWcGVYYkNvM21Lbk9sM3pMOTBjbm5I?=
 =?utf-8?B?Z21iUWlpcUVpZzZWUWVTSTlTakNoakFXcFhDNFl4Y1VTOWc1RUpSeWtQMzR5?=
 =?utf-8?B?SXQzR3YrU3JZV1J1ZGczdm1NdlBUS29pRzhQSThPV044elJ5MjAzRmYrdzBZ?=
 =?utf-8?B?VHB2bktHcG9CdTBtR3dHV2h3NWVScDdrb1Zld2R4Z2dqRktadE9BUUhBSDRL?=
 =?utf-8?B?V2p4UEdjemZTV0tXVHRuVFg5c2JuM3ZwL0JGOVNtMVNHenFrT3h3bTdnQzgy?=
 =?utf-8?B?emJ4YTdyZE5ONVpING1rMFI2SlhvKzZ2dXkvMzlDRzMvTEFIck45Y09MTUkw?=
 =?utf-8?B?c1VBelllbTdJWkZmNEZWN3FWT1I1eTR2dkZCdjN6QXZ4djdDTGtFTDFnWVA3?=
 =?utf-8?B?Mzk2WmtmN2RLeHBQKzhzdXljVDdCaVVxWndlREMrT2tmL3gwYXdFRjErNXBl?=
 =?utf-8?B?NVJhcURtTWFNaHY2Zzk5MWdlMnJPbjJnVU1OSEhnMUVpVEZiQjJLY01adTE0?=
 =?utf-8?B?SGlxcE5kdVhzUUN3azgzZ21EREZJc1pGb05lS3ByQkxVZW9HVml3NE1Sdmgw?=
 =?utf-8?B?KzMwdVZQRkJGZjkyOThmOXlPS2RUSkNWZVcrQ3R6VHJaa1BBaWZXbi9saG93?=
 =?utf-8?B?RXFrSm5za1A2QTN1OVZWOHpxV2hiS3FHT0JHakM5OE1tc0l1WU9LNmJ5aUc0?=
 =?utf-8?B?cVlmK1MzcjV4VVdpb1I1YlRJUTVKb1JqT1BCZm1KcUVZZEtoMFI2WWZ5Z1pT?=
 =?utf-8?B?STRuanpzRG1RQWNpaDhnMFZqajJGMlhiWkhaSnZMMUJOVU1KNjZnaUJBMzJv?=
 =?utf-8?B?c3R2OVZtWU02TUtrMHBWaW1XVzMxVjNMbGtDbjZyeUpkTFltRVlOQnM4YlZS?=
 =?utf-8?B?T00yZ0dWVExyeVRCeHRyYU5KVFR6ZnFxRm9JeE5qN1NZWkFhaDZOSVlFOGhn?=
 =?utf-8?B?QWVUcm9lRGFha3FhYWkrVHlUa3RSZXo3NVZhRGV0RnRFQStSU2g0cWtKRzNL?=
 =?utf-8?B?RkM0cnRSYXhkMGpyQjBJSlJzV3oyNm1sdUd5c29QQ2xUdGpMeGhzcThuSmpW?=
 =?utf-8?B?Qkl0QnNMRkRvVVFBMU1Ub2k2amUyZmVXalhDZ29KNzBXTEVYeVVSTGJoektq?=
 =?utf-8?Q?OVkfEnYglmhe6Hdwz3breBQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855c3618-57aa-40c4-58e3-08d9c47a6bc1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 12:07:12.4252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPooapoWt19IEJlphpyWzHj37Ka3otPNiAjVVl8q0o/q7oTe8HABCU9ZvX5AhgchC+qsN3wUd94hRNVvJsIkfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 16.12.2021 10:54, Andrew Cooper wrote:
> PKS is incredibly similar to the existing PKU behaviour, operating on
> pagewalks for any supervisor mapping.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


