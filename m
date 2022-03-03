Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468D04CBBA2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:44:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283085.481981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiwd-0001cZ-9P; Thu, 03 Mar 2022 10:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283085.481981; Thu, 03 Mar 2022 10:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiwd-0001aj-67; Thu, 03 Mar 2022 10:44:27 +0000
Received: by outflank-mailman (input) for mailman id 283085;
 Thu, 03 Mar 2022 10:44:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPiwb-0001aM-CX
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:44:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e420bdb3-9ade-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 11:44:24 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-fz-SpLJYO_WP5cn3q9lFlw-1; Thu, 03 Mar 2022 11:44:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR04MB3222.eurprd04.prod.outlook.com (2603:10a6:6:6::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.26; Thu, 3 Mar 2022 10:44:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:44:20 +0000
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
X-Inumbo-ID: e420bdb3-9ade-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646304264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/cSr//zUySgh3p61hyWfGiVpohofSuaIl4HgD6Dgz0=;
	b=dpXkBs/7LUckjGm+Mo3g2HOk8zBFPMB6Z3gmhsa+xGTn9X73+NdSFAxMX5AOLYf33CNcIL
	+Vi4nC4dn6zKM6LpPJ4RqIBgDZduKJdV8YGXvxVs0dGPbr8BZeGZcjgijl/EysawCRT18j
	NVX8GI3FoMb87wYpMuLlTdbjThOT0TA=
X-MC-Unique: fz-SpLJYO_WP5cn3q9lFlw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3Umos+PP4yUudXzjiojxkaFsWDc/+UbR6HNpBReN40wYP2AdvGdEV5Eua/huz3ffAxGczAolNi7jQBURcAns7+XketKYgDi77uHdmvJPtUzzNlPPS3fTqOyxHP+53OYCBR+PrhIKCZCMgtXyYXkjfN6Bq3TwMm2TtCKh+x9iE7CU9QPPrPT4WTbTIs5Fzc19nIyVnW5ltTvnwt88wnjFEwiC0fx+5mFNUxyi3PjNUCrwD+8s4QeFsf70Y7owF7AloMhFCc8jRgNWnsWkzXcSQU6FV+gGfv7ChHSreCDPBYWTu7+SzHr2pxkxVEoa4ZBvKm4uqJnlWB0ahmMhnvD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/cSr//zUySgh3p61hyWfGiVpohofSuaIl4HgD6Dgz0=;
 b=f2odHtm7mQJUlUmeI3O/VjyghwpWLhCGC+K5Md+2Scy2pXOynNfp+W7r9x6D2gTA8b5qxPSA9HScW3XRfp4aNyubWenrD6wm6vXubylAP5rvjJCS9zw6BeSRuBBA1Dpa6vpDHHQPJ8vhur0jY9E6l17KXcftX2SZ1MQp+l5ufuLuyzbVj6b57YuuRaItyHAecz5qJpD6mDH7jv8U3qppzYlzVLNSOrdT3k2PvNO4bNwanlfY3Zm9fcIpprT+E1CJXs4gzih4dLwfwlDlJjw9QTo+5Jm1zXOK+zspctcSVgMBGaDRgL/dYm3JClLuPjJo0LgzIDsLpwzy/dslK1ihSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3dfc455f-68ef-77d2-8dbc-5f7a9f7f2364@suse.com>
Date: Thu, 3 Mar 2022 11:44:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [XEN PATCH v9 27/30] build: rework "headers*.chk" prerequisite in
 include/
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-28-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125110103.3527686-28-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0043.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b513a206-60c2-4693-d1b9-08d9fd02c5be
X-MS-TrafficTypeDiagnostic: DB6PR04MB3222:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB322236B71FF542F8F7F4F82AB3049@DB6PR04MB3222.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tKvLcEmldaJbY8Y1IEZrP6cmrHz9aNDBsiT8aBZ4G0kbiR45KSt3c5fpaw8qnMRob5GCdHzHhAUzXxKXBNlUCeRiPd5wcGDt/g15IIW8LODrJWvYXZ1OBchH6rqx6eqVbbOm8h88dMkG5RyCuZJiVkSZ9EMkEX5W44Yo5cEBVLmJJac1vBhVDpKi7NvmzobuTrlqsl1xZz9Dok+oDN7Kr8VgHoj8tn75O24bsYwHvc6rqVZdj8OgeQwrM8c82FxUbeRHbU4RA5TN2FXyAoRvKQYXb6obqGVzf4U1KiZjy3xN74uePjb1qMgjWbip7PncQGM1vhiWROat3qufBTAvdOjx3UIBtJTNkWqLrfnijcTzYDdDZQrp617NVgP4ecuDemw3dWpRrz/xDgToKZzY9sUaGltObltcWzgd1XJAAbm1PuGDuK4Nqwn5WsfEtDOL6hoYuEWSNYgE95foNrgmzVNcxUnH71BHa7Lpuvtah49lTCeWfSDADv/yVV5cdG1149U/Vug6MBzyd7pR/6i5J8ErouOulAQaiUdNvm86r8uLUITuP05mYe3nMNci8YwnjUMdJ0Rw70ebG+eY6cmTAqe/7XdS3bebsGqNn9snTyrK6TzYjYeYnrPRNW8pu/4BKg/OwEihHuidY3XiGZ8bOZKCHyXR86Qx72UqpR7LOpbm4rNiPN/f0gTE1ZgGg0eGRlbXbSbJkVAQH+IPJ2xEU/07ph+7EBZzIBBH0OpzHdQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6916009)(38100700002)(66476007)(8676002)(66556008)(66946007)(54906003)(8936002)(4744005)(4326008)(5660300002)(86362001)(31686004)(31696002)(316002)(2906002)(2616005)(26005)(186003)(508600001)(6666004)(6486002)(53546011)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlN2Q2swcGFCUERKUStlWUp3Ny9ZYU93TE9oQ01VSkxCSmw0eFZGS0dMZXBV?=
 =?utf-8?B?T2d4K3V1UjZ0SGpERWlHRlo2TkovL2lJQVZtaVNJVUxMYWZadS93aGJpWDdy?=
 =?utf-8?B?amhES0J2UlE0dW9oRVNHSlEvL3JMdW53aGRaTDFFVlJEUTBDbytqYmZOemJz?=
 =?utf-8?B?UjJBTVN4MHdrL043QnBBang5MUJjTGRBS2w2T1Y3YVZSQUVia2lQWEpxelp2?=
 =?utf-8?B?ekx3TGFxVWxFeDJaSjVxNVYwUEZVcXF1dlZJek1TSFp2NFMvdHdjQkxkTUxC?=
 =?utf-8?B?eHdVdjYwUUZlQVVvZXJRd2lIaThsK29walByQU9kd3A5THJKNFpiNk1IM3l5?=
 =?utf-8?B?U3FFb2VJb0JOd1p1MHZiQ09kU0ZJWFc1dXRZNG9ZWUFBZTlOaU5XaU1Xdm9H?=
 =?utf-8?B?TS9VT1pVQm5kYXpuWlc5Wlo5RkpOY2VteGJwYUNWdnlBM0g2eXdNUWwxMFRy?=
 =?utf-8?B?bFBqNjBWbENYLzBQVnBtU1U5OXdVaE5zcHlKQ05ET0ZNdDg1aS8zMUZCV3pZ?=
 =?utf-8?B?dTlDaCtURFRyMHYyOVFWZW44TVlNSUFSOG96eUdFSlRZcW5uSUJNZ0Q3eWIz?=
 =?utf-8?B?OXRiSWZtMGt3VkhpOEZ4cmZ1NW5OU2RqWTRVcnMyVUwwV24zUkRXNFJTMCtu?=
 =?utf-8?B?OUJhbW52czhuUDNTQlpJcmpGTnFaT1kxbU9DejZncTg1OFR3STF2MnJGWE90?=
 =?utf-8?B?NDFXNmpEWDZwQm5nRVdoNXZEUWF2aVdKMEFUQTZLQndsQ1VuTzBVZVk0Q1RH?=
 =?utf-8?B?R3V0THIzdHNFZHlBdkRNNHErMkMzSDJUeFBSZG8ySlFFMHN1NVhOaTZ0WXR5?=
 =?utf-8?B?OWdmK3g3Zi94eFNBVjByK3Ira2VSMXRFV3dEUEVKNWJOVExEV28yb3NmS0lN?=
 =?utf-8?B?Q0F1QklkbXFRYytxK2FLb3ZRM21qb3JETUJDdlRhN2dTL29OYnc0ams0ZTN0?=
 =?utf-8?B?Q2ZsTkZVc3FaMDZTcFBSNjQ0aU1XdUlLSjhDdnJMaGJLeVRjVG9lTDluaW1I?=
 =?utf-8?B?WFZwYkZVRHZhMUEzY09IemJMV1BYZEZ6NXVqRHpXQzRtMVdHcEYwZHlwUkdp?=
 =?utf-8?B?STQwM0ZCaHlaY21BV3dxaGJxWWlaM0IvN3M0R0hhZU4zRDZzdU1raGtLaXV3?=
 =?utf-8?B?RFpIYzArL05IN1E1bjh1cWxFUzNjbFZMNUpmaUJsOTIwZFRzQTgrMSsrSHlG?=
 =?utf-8?B?SE5DZ0RES0xzWWRXTTJFTkd4eUhvRmEwNjhaNjQvS1ZVTVRKNkphN2U3NlBK?=
 =?utf-8?B?U1hEQmxOd3MyZjBuaVcvUmhEK2d4S0lEcnJ2b3hmNWY0dWVFazVFd3ZnTmc4?=
 =?utf-8?B?eS8xdFpVeTh2QTZndC9VKzdoR2VHQ1VSelpmMjBTVmZrRmVBOVlQL3lieGRn?=
 =?utf-8?B?bng3SDNTRlVTaDhVN0FtUS9hcE8vOTdqc0xZQ2N5T2VGWCtLTjZaVGcvcVBY?=
 =?utf-8?B?NGdFM3NPeDZrT0dPY2NCWE51bFk0RjJ4dUJ1RWF6cUhHbFpPYU5pZXJhaHl1?=
 =?utf-8?B?OFdwZFdhcVJRQnNhVkpmb3Q3cVFwZ2hoejgxUGhhcDZ6VUFrWmt2WXpvbkhr?=
 =?utf-8?B?R1UzN2gvbFM3NkJGOXhPeWdhVGtXYTdSWW9aQ0hyN0xrazFpQlFFaVBRUTho?=
 =?utf-8?B?SHl5ODhSeVBVdHQ2bU1SQU81ck9mNk5KTUVFNFpzOXN0WkorRmQ4NUxRazlJ?=
 =?utf-8?B?bEh1MmVPL1JrTCsxNll0QklzZWFEcGhpMC96YW9zSWRkYy9BQkNTMkx3Ujhs?=
 =?utf-8?B?VU95R3JFM1F3RzN1dktneVRPYklIdEJ2OUdmNWVOd2UrekFvQmpXTVlhVkVD?=
 =?utf-8?B?RFRxbHFRTVdVc3VYVmRzQmZVd3JqMVE2aDhYYU9xcUVyU1Y5Wkk5QU8yenox?=
 =?utf-8?B?K1NLankyZEJCNlB2Vy9rZ3R2M0kyWEIvZFBMYTFEUmFqRmE0Zi9VNEtXT3pF?=
 =?utf-8?B?UitjQlRld2dLSzVqRHZSV0hkOWVTb0NVaFVkR2lsNUIvUERUSjRndzduL1ln?=
 =?utf-8?B?QXI3N3NwK0MvZ2RTb1hiQ3BtRjJHNVRxWksxa2M5dnRxRDcwbUh0dm10cEZn?=
 =?utf-8?B?Wk4ySFdSNm1XOURJSEptcnNONVIvalhXRHBxaGlDMU1rT1kxeXhPSG5MbkZP?=
 =?utf-8?B?K0V2bVhNR3FXdXV4bDR0ZU5NaTdIb0kra2V5RXArSk9UbG1pZloxdTcyc1M2?=
 =?utf-8?Q?GzWjeRcvPffFRrm718bMRTc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b513a206-60c2-4693-d1b9-08d9fd02c5be
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:44:20.0577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SC0qCMCzslu6iaz9Ois8CtEYjxzTj+xNs/c+5QdRQd1uoSmqjchjNTg88o5sGAM5CImyqw8g5nwHXVsEnyOSqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3222

On 25.01.2022 12:01, Anthony PERARD wrote:
> Listing public headers when out-of-tree build are involved becomes
> more annoying where every path to every headers needs to start with
> "$(srctree)/$(src)", or $(wildcard ) will not work. This means more
> repetition. ( "$(srcdir)" is a shortcut for "$(srctree)/$(src)" )
> 
> This patch attempt to reduce the amount of duplication and make better
> use of make's meta programming capability. The filters are now listed
> in a variable and don't have to repeat the path to the headers files
> as this is added later as needed.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


