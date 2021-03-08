Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BC6330F11
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 14:24:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94929.178927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFrf-0003kP-S6; Mon, 08 Mar 2021 13:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94929.178927; Mon, 08 Mar 2021 13:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFrf-0003k0-Or; Mon, 08 Mar 2021 13:24:03 +0000
Received: by outflank-mailman (input) for mailman id 94929;
 Mon, 08 Mar 2021 13:24:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSVd=IG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lJFre-0003jv-Ju
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 13:24:02 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 126a8a3a-8337-4d12-843b-61420450df22;
 Mon, 08 Mar 2021 13:24:01 +0000 (UTC)
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
X-Inumbo-ID: 126a8a3a-8337-4d12-843b-61420450df22
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615209841;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dvnutj5LhdEbnqawxG8imUUOTyeJZ+QPZ7sJp9w/BPk=;
  b=VOOiJu8Hdb6jkgV+wKQf9XBpc22hmbqpq99CzcI3FVGEajzAboAvegBo
   RVhI3cub3D8k7g79O/qQ3nsarsJF9K0xP3mVfi87EgGjD74dS7pcb1UT+
   Cng9QXOBVt+iEQlXaDH7rCHJW1weUiexvZ1n5h6HO3QgG295MDymM9C5O
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xwSVB7zjdkutq2fZNKgNP0aTB5o9b8mNabj8iB2p8nmcMtJFWr6AMlqYXeRNdCU0YbycmvehpP
 fNGExeAh/4pZhw4vUzFXW9QMYGkAWqEgHGxI/kXNVij853OHYgGagv5C0HbitOPBRzXhSCpCQz
 J9LUyGGFard/l0sUccZUFaHzv0hMO0dHE5qEQi+gfFNJVW2i8RDx3x6B98Q/9E6SoSpLFu+aX9
 r3cI1zC64HuwLrMzm1RJcRW6QbhY2Be3LtE4p/qKxViUPtVqURValOPhphIlX43KNlt0QQoWtG
 TeE=
X-SBRS: 5.2
X-MesageID: 38679564
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="38679564"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5pQ02Vt6N37awqUQYotm6TGTdid6/Q6Xkq+Da4Bb/rW4+c1NHE+hWrGnAT5Mteb7mH3U0cDDy8kn8q96ZZovp8Bfepjkh/4X1lMzEKgeXVLQUu68kfw6xvfdyVy9egtzdoOPbdyVsxTaRNtSNRxOeLmXd0GOUYO30G71yo/fcKmlpiy+gpKhIJofcXI7OG+Y4lakJiCwSIiSHtSsXZaC++3SzCvOreBdUpbnyVWGdyCWl4nDCnyouFod8M+RbEkKcpL8b6WtPGXSxUJTkoNo2b9HGhLoTCNtiVfrf5Nui2mIUidsmI6JCcyaQgU/PdQxBM5bhOgCcP0MfUQVcgTpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il//Mm0vq5qV1tMQrzMYc2d+Zzd83nBje/+yds0tuJ8=;
 b=NYn5rwea0tlm9YI6vzB35/gVtAomNnULqwepPP6jNeKWLdlEbKzdctBwEdPn5VkdYKsKVUIG90FHqtEaJIxkNCqEdwm84PMXfOWkAWm1tfzr115zwgzBsnwwzC+/1J0KmfhtNWKkmIXgbd+NfIRHsDuJsI9o9z0jV05wxd9Y6tTPAaMFSgln4tuu4haWpVwFA9iU19I9JmTdoE2JRwkE4Z5WIGFzX2PjjOmsweyWsorTVSdAGmoD/sNHB0EbCj2Gh5btAC39yBmFEFPZAP2AxF9vPOH9YpoW1WxKsyHOuMZizNVRdkoezS53V1LVn+GxBtPxk8O6SkjwwVBObjNoDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=il//Mm0vq5qV1tMQrzMYc2d+Zzd83nBje/+yds0tuJ8=;
 b=hJrvWvc1I6Gb70KoIP2PRKw7RucM0eh3KCbG8WfhAvz/bUwy6saZbJP0Pz0ON0/5QHlsDGh6421szZnhrx39qOMfhAADUb++h1Q2Tf4gidO4pGSBtqscbjV00TA1NLY15fA6JJQtWFrR1D03kr4HQu6pUyoyPOc5SlyKExA4A38=
Date: Mon, 8 Mar 2021 14:23:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH v2 2/2][4.15] x86/AMD: expose HWCR.TscFreqSel to guests
Message-ID: <YEYlTSkm5jmP2qeE@Air-de-Roger>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com>
 <d4e927da-97ee-d4ca-2407-03793f2f4c24@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d4e927da-97ee-d4ca-2407-03793f2f4c24@citrix.com>
X-ClientProxiedBy: PR0P264CA0054.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b64e94b-2993-4fbf-0a5b-08d8e2355df5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB297133D2DB81BAE85C5CE39F8F939@DM5PR03MB2971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GjgaCYsTvg6lld/pvkWDotssrkkRjmKepCNGXzFcRm5xrEaP2HohoGqi5eFmbSJiBmwZi+mF4dt2+PAT9FHLJB66mmc3PixGYPMrIyo6lNuDPuGYHNCu5NMyqvKrgqNB2yFHsuNTLfA7XinTwYXmWz9+5OJ10XUqaOLAR6ML/bRkCr+WZ9lyMRK2XxtLez8LWtKL87Ggr7RyoTORfO30CF45KjnMb/vDC13mO6aYxPXM0RHL2xfWqtZrI4R4qdv0jnCQ9SfT0ychwPH302kXZ0K5xh2X0GzsbGUKhtyLMuSAAS6/9nDiEJvoid6jdLgmDTmyCCEWzAB55hxqTBsomhNcnKXKBv7BV/Lx7+QFtb+ugzPzcyHAPNjPJI6OWUmvJEYmtYqHl1vsnovaHRo/kxLQuhyA0VsztcDqSb0k9jY8Dlmj9abNO84Zq8SSNWNBVD/w7VZ/5N4gDR99CrVP3PpMX3RDYgn0C5aj4NDYlZKuSP5Wd/le5spUXxw/HIUcHh7CqkXbUMLNyPx+14vn6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(366004)(396003)(39860400002)(136003)(376002)(5660300002)(66476007)(66556008)(2906002)(4744005)(26005)(8676002)(6496006)(6862004)(8936002)(53546011)(478600001)(956004)(6486002)(86362001)(4326008)(66946007)(16526019)(6666004)(186003)(316002)(33716001)(85182001)(83380400001)(6636002)(9686003)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dkl3LzJBcXpaa1N5Q3BVUU5mUEw1WWFreE9tQWpGdzVmT2IvVXlMYWtNN0tW?=
 =?utf-8?B?M0JvY0oxbk55MEZwNDF3WEpUbE1vUEk5SFVhUGE2emRCcUE4Y1QxM29VWEFr?=
 =?utf-8?B?Y25uUG9XOHhZcmpKNVQwV2gyRk53V1E0eUNtQitpL2NYcUVPaERvWjRuS1Ru?=
 =?utf-8?B?bUNndXEydDhXek9EQU95TVN1Y2NQMGRPbnpwRjJ5dTZzNlVSTHh6SXFsSEdI?=
 =?utf-8?B?WHJpVDZOYmtlZ3JPa2g3VnBBckJITGVzcm1vZFNvQVlZc0FrV2JBQzlGN1lT?=
 =?utf-8?B?c015andCbkR1cGtmTGlTU0U0RWlTV0lkYWRvSnF4ZTRoVnlRUytnTSswVHNk?=
 =?utf-8?B?R3BzMC9MWjM5TXZrMlpZU295YS9hVmVEY1VhdUhtZXFJVnVkRUpWNjdST1kx?=
 =?utf-8?B?V3ZjeXVJcGN3WTM4QzlZQjZEV1F3ODA1bDBiOGpSeFZEUmhZa0VmL3pqUWFD?=
 =?utf-8?B?cFo4V2p1QWFwSnV4MVluVERhMExnekM3NUJOZUN1aHhDcnVhdHcwSkR0QkJO?=
 =?utf-8?B?SmZQZjFpZldSSTFITDJPbE91ZW9wd0lpRGhSQm5SWiszdmo0b05xVDNVSENO?=
 =?utf-8?B?Y2lJSjh5TW0wN29BTEI0NVNEM3pwb25kaG54QnNwY25JWE5VaUE3T09Zdjk5?=
 =?utf-8?B?OFl6NGl5dG1lL1hhRzQ5dnVCZGNKbEhqRlVZdU02aGEzUGZRdTJkVEFGS1BV?=
 =?utf-8?B?enYrZzFMbTYxVkJFZ2IyZE1uUG1VbWhDZ2FmN3MxaHJkSkZPRlV4T21Hc1kv?=
 =?utf-8?B?Ylllek9VdnNmSDE4RHlDQm5pbnRhOXFsTURERzZYaUw2bWUrZ3VZbFBkNlQy?=
 =?utf-8?B?L2xOS1R6QzNyOUNkTmJlRnU1WmgvOVVGZEtYTmc4em11eU1iV2o0eENKcFA1?=
 =?utf-8?B?ODJvSVZBa3R0OVJhTlFYTkRDYVplcVJmZmR5SEZJUUNST25IYWpkVEJCRjNu?=
 =?utf-8?B?cURxdW5XNms1NHNrMXY0U1hqOG00NGpoSEhEb3JTdTV1M1dhd3U4blNpTGdm?=
 =?utf-8?B?VVJ1ZWtPaTN3c2xrdzR5aU1POUdLT294UzNGNjhtTWVJNmZpQks3cVZtNjE0?=
 =?utf-8?B?cmpCVGxrbHNFa2Q2bzlzV3RuSmVTYzNnV0VFbjBNUU9XTEJhb2M3Q2szeUdu?=
 =?utf-8?B?YXhpRjZWcGZhRTVpY054VkRsaWJxY250eVZNeU1SU2U1LytlQ2xMTkEzdzBy?=
 =?utf-8?B?bzd2V0hhdGZkQjNJa2lsRHIwUnJBNldWdGVtZWkxcUp2Wm5CYVpTVmFncFlN?=
 =?utf-8?B?b1Z5S0kzRmtnQ00zQzRsWkJGdDlQcHA1bStyNlA3NklDTGFRQm1MdHdNT2U1?=
 =?utf-8?B?OUNLWFVmZi9tOGVQSHArc1FTcnFjL1dSRjRSWDhlR1Y4TS9TcGQyQVZFWXov?=
 =?utf-8?B?VnB6Nk1LSnJqK0IvR0REWmdlZjJBRFVhd2NSd2NKMzBna3hUbVNYN1ZweFdO?=
 =?utf-8?B?R0RrbVJhdFhqNk1iOTl0bXdJMW5ZMlY4MkVucHJKYjFRM1BISnNBRC96bVRR?=
 =?utf-8?B?eER6UlJ3SmZqQnhnZlpzU3JLelRnY0pSUS8zeE1NbXo2VVVjOGFTRzMxL294?=
 =?utf-8?B?b283SHgwNkFxaTl5cVk1M0t5Y3ZTQUI5aUViT1ZzMGdYcGlMRjlLY0w3VHh1?=
 =?utf-8?B?VDhtSXQ5MUtZVzU2M2l0OUlCZXFuVEhVK0NLc1ZmVVVuNTdCM0M0bVExOW5Z?=
 =?utf-8?B?QU9abXhKRUQ0akNPTCtUMmlOV0trTHhRUjB1QnhEYTNRVStWMkNxZWtyYXJB?=
 =?utf-8?Q?fk3sHAIeiJQ1/y45XStG3dPhY3Kk/XfKW5bFIVd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b64e94b-2993-4fbf-0a5b-08d8e2355df5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 13:23:31.1564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/nuhCr8cLOl98DW5+/ZgDFypAM3E0pgL4SHyZ9gWay7fV9CLEqK50CWkJbK9+baKAay2+EEHqq5BRedv1URzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2971
X-OriginatorOrg: citrix.com

On Mon, Mar 08, 2021 at 12:41:26PM +0000, Andrew Cooper wrote:
> On 05/03/2021 09:50, Jan Beulich wrote:
> > Linux has been warning ("firmware bug") about this bit being clear for a
> > long time. While writable in older hardware it has been readonly on more
> > than just most recent hardware. For simplicitly report it always set (if
> > anything we may want to log the issue ourselves if it turns out to be
> > clear on older hardware).
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I realise Linux is complaining, but simply setting the bit isn't a fix.
> 
> This needs corresponding updates in the ACPI tables, as well as Pstate
> MSRs, or Linux will derive a false relationship between the TSC rate and
> wallclock.

Is there any description of those relations?

I don't seem to find any other MSR referencing the TscFreqSel bit in
HWCR on the AMD Open-Source Register Reference, but I might be looking
at the wrong place.

Thanks, Roger.

