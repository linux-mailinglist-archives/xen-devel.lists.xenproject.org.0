Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B22FA82C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 19:02:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69948.125423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Yqi-0004d1-UO; Mon, 18 Jan 2021 18:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69948.125423; Mon, 18 Jan 2021 18:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Yqi-0004ca-Qc; Mon, 18 Jan 2021 18:01:56 +0000
Received: by outflank-mailman (input) for mailman id 69948;
 Mon, 18 Jan 2021 18:01:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1Yqh-0004cR-Db
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 18:01:55 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0022149b-6691-46e8-a455-99eee7d7ea89;
 Mon, 18 Jan 2021 18:01:54 +0000 (UTC)
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
X-Inumbo-ID: 0022149b-6691-46e8-a455-99eee7d7ea89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610992914;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3RXZRlAIuEeWzS0guxsXoXfZxh+Z6dfQeBfjbKnvb7Q=;
  b=egwbDlqu8cvsPS7qLJKzZx4ZlFFRCQxY/xOli7bZsYOjnGKwwIPNmUkm
   U+2ACF8CvJEnlJbNnooE7W0yeVd4uy3T7qk3X6ypjd9nw48ncRpzBWDCf
   S04Qc7jKdtiVTzB1dbRTfDqNVuurSoeRHh/sZqCH1psQXO6xJhdEcRV50
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: h9pqkL1sGDyOYJ/LFSYxOHUzDzXo++NEJw7z6DLbCieQnvJ+NPCX/pxIJrM4n12ceyJ08SvRHm
 DlFg71f2TUI6QlKl/pFh8DZZMpOT/lwDVg/q3twxI1FeRaO3EKnWI4M3zeSK+Yo1NHcvgad5TY
 Ih/0YHFsEIMOqLWu2OLtmcveFC3FHFpGE1FNUvbu4K7VikkKlDWoJdozoDcajBMPe3en41iJ1a
 9vURaGiS85ZrFnW2ZGN8OMwb/3n4+S5klaq+8J6BgaC5jZG5E/nbSnKUvUtsfFufJPQl6pXXlt
 pDs=
X-SBRS: 5.2
X-MesageID: 36613303
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="36613303"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbD78T41tllQKTwcGAOVNH+zAUF/H5Yh8C+M16sVYepNqPDiyYcDxaFHZj6pIOL3xci1Udf15smd4lOGHfXDuHJdWJRUj39yr6JWhBuFTtQpg1q74ciIULA+1FT8oHYc6xzSpGO4m7yW1V92ZfHC8Ty8YvAv+FnGok0fFMo4zM6GYAtN/QD2iS3gO5BlBQ1Kg2sN9jJKV76p4iiGkiiXpTBuLHn4TL2zKWym5ZRYylSyYKzn8NGHAkFeMe5XZPpM0b4DZLWXovKYZ2AMrafWQ6dWGhkb8RBhrzDQekkkrEUwkS3QUD5iwFY4Yu7IoZ/QpHzR5GppQPsF+jN8cEisFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90NQWrmSkoJXHsEpu6BC/fUezLZXN/qCHQ/MXV9EXbg=;
 b=Jzc2rQNmg8EaaDwt+zTv6L3CUfTVKBFyC4VKcGu45eoCZSFKVYvZaZJ9OeeZXQVEP5KvR9fIqB9Dc0uNLR4M2fgCVNwPbgKRkNSn5vHe4AVdBQwFPq24UckW/hoElcEp358Q59t2zbr1PI1JBQtmO6ULn7yvTGhv71n9decNeIyElZM9DjDZBULm4JY1ICJ2bW04W6nhjHbydQ0z9pUFcDBiBoholOayBgQ4kLgtz1GfF3lFopkL23Di5NWqM6oZWI4F0vXZj7zPfHPoJVEakVE4gquwhxCVv4carDt1c2YfkJh1PhNcvtuSN0ij5rQ5DJMT9Ko96QJ3TCLNt1pAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90NQWrmSkoJXHsEpu6BC/fUezLZXN/qCHQ/MXV9EXbg=;
 b=Pdrr2dsgWK/EZS0A4rpWDArkU0itwXWUCOVM+LKz4JZPHjyBWxIq/INiG+Cq8+1EqRni5lYbSTLwlU66vZ+OLKFcEka/XTzCvk40fFYXT13Oi69vuAK4J2Pyld5xnoj1+ileSR71KyjOMetsSr3AE+2IS68ab5r5hJfjgLtPujs=
Date: Mon, 18 Jan 2021 19:01:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libs/evtchn: fix build on NetBSD.
Message-ID: <20210118180145.chhuiehxwc3ocd2q@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-10-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-10-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d33c343-261d-4ca5-495e-08d8bbdb2148
X-MS-TrafficTypeDiagnostic: DM6PR03MB5179:
X-Microsoft-Antispam-PRVS: <DM6PR03MB517938D7E8ADD336AB1E4EA28FA40@DM6PR03MB5179.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xfLODNeBUXsnEAOJvQ17HM6UnRetNFhSHCHSerI9iMVEIlNUjUUJTEhLk6fqYIF41oiYlvRWGhi7RRrFGXAKbeyQCfqE/9FKvRbLxK50KywYNTwaoQ3XpPfYzpWJdpUGEPsAhl/9GOlQKA5YviAD36m3Xn756op2f3uCDa1yWl7vSTeLdPXaqXTMSOYdZGx8KHZmjTItPF1S3u7+Vj+gWLuH8bFvP2QnKarUtVbysnmCZJX+LF880vW4hJDkkFwJGE5y56pBnfPNF+jPkVrqBfJsthHUJRj7Y8z4c/XwJGB0Cox7OtXqW5FRUdqZEg3yU8Y3onxe4ylK5Vwpeb8PtkhhnrsUn0XSFBINFf46pjRCAMLI+Jb+oCHmWOo94egZqR//uxL9pav12+k/d2IExw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(6496006)(478600001)(316002)(54906003)(6916009)(6666004)(186003)(5660300002)(4744005)(26005)(66556008)(1076003)(66476007)(66946007)(33716001)(956004)(16526019)(8676002)(86362001)(8936002)(6486002)(9686003)(85182001)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?elB6YmNSalRHN0Y5UHFOT0ViUXhIdHVybVdpdjdOM2NRM253MjRkc3NubE9J?=
 =?utf-8?B?SFAxdU12VHdicm9qTkUvNzN3OExZSlR4a25ZaGpuRzY4ajFIVTQ2dXduK0Vw?=
 =?utf-8?B?UjBFQ00rbU9NclRaRTlIRVpNbm53bXRnOWhWSlJWVSszcFhIMzB5SWZCaVNr?=
 =?utf-8?B?Yzd4UWxOS0NZM3FwMVFkWW1VTHdxT3NpL1BndFZzOWprRU5zMDVvaUowVSs2?=
 =?utf-8?B?WW1UU3hvZ3BOM0o2TEdYa1ErVTVSTFpVMTVlS2RFcStacWtqQWxRV09BVmRQ?=
 =?utf-8?B?UFdkUTJwR2VucitYQytPSkRUbWFuZXIwVmZYSzk3WnZIUFdrbXZIRVZxTUVq?=
 =?utf-8?B?R0FOSHg0L20vZm56SlQzaWNYMW8rTjNDeDZTT2xBT2dPQWlBOVRIZWpxa1dX?=
 =?utf-8?B?Q2pKc3M0R0ppYXBPNDc1TUpZejI0bzEyU1Fyd1c2Q1VxQmFES3ZKRzVMcVNW?=
 =?utf-8?B?WW5SVjJpWG1DOHIrbE50a05LTFRmbXhVY0ZxVSsrcU5MVFB5bXY1OW95SWJY?=
 =?utf-8?B?cFZHNXJ5MWFNSGZROXdmOCtyZExobkZ4d2ZSM0phNkJZYXdMYnB3TkRrQlJM?=
 =?utf-8?B?UkVwdVBVODMzNnJkWFh2WVdIZWJrOUd3dkE5a1QyUmpYY205b3IwV1hKcmh1?=
 =?utf-8?B?T0FKWk1UYWFvV3dJRG1qU1F1bzNxQTJoY3o3cGg0aEgza2hRL1JsSXg2U1dZ?=
 =?utf-8?B?UGcwaloyK0hYWkNzbFpvT3hoOFo1VVpQenhYaE1mTkNCWVpXYlFOaUNCVUpH?=
 =?utf-8?B?OUNsZThjZEVXS1dqcmVocjZIeVRJVC9RdWdvT3ZJYlVOT2J5OWlsNHQ3Mlo2?=
 =?utf-8?B?Ujh2emhwMzQvYi82UjVRMHJCb3RHZW8zRGdRMWw4WkhicGlaSFpTanJXL3cy?=
 =?utf-8?B?RkU5NTFla2U3eDZDczl2Vk0rZEJrQ3hxUGJwdzlhY2puR2YvT2lwNEpHOVBG?=
 =?utf-8?B?TWRqN1ZQbWkzTlo0bnpVZElXOHRVTHpyclFmL1h2alpZRnpJWVFBRFFkUC9M?=
 =?utf-8?B?Tk0yTnFqZmlMaVlkZUhLcTQ0M095cldsSEFMTVJKOHFTK1lKL213c1V1eGRl?=
 =?utf-8?B?cTVSelpWUFRKaStHNVE3VFozNWNHQmdDTTRWNkVEWW8wQXRWbUpkUkhaa1Bz?=
 =?utf-8?B?Rm5tR29kZVlxL0hvV3FkNUNSNFFRRm9lYUdoWjNIN1NXOThTTmpnUFBZN0pv?=
 =?utf-8?B?Zjg3Q3IrbzA3SjE5d2ljQnlCTi9MSUJZVjZHV2NkRk9KbHJiK2pCRWdCZ2pv?=
 =?utf-8?B?Qmw1NkU0cm94QkFXVGRpSytvMUVGZjcxKzJ4dHVtVFI5SjdpUXI1MjRjU2w5?=
 =?utf-8?Q?xbZx9uqKbSuyscuasovCq1BN9TUXtCZydj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d33c343-261d-4ca5-495e-08d8bbdb2148
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 18:01:50.4597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvTO2DKEF+Mis8Keeb5KnSlqpU+ah0X3EuYKmJzAtt+0CAkKmNHWwHY/beliOGtGhQPW5VxVd4378QZ0oCvCpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5179
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:30PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> use xenio3.h for ioctl definitions
> read_exact/write_exact seems to not be available here, which cause
> a gcc error.
> Use plain read/write, the xenevtchn interface won't do partial read/write
> on NetBSD anyway so it should be safe.

I would add: This is inline with the rest of the OS specific helpers
that also use plain read/write calls.

> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

