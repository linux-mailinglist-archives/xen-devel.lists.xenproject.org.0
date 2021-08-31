Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DB53FC7F9
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 15:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175708.319991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3ah-0007QM-CF; Tue, 31 Aug 2021 13:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175708.319991; Tue, 31 Aug 2021 13:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL3ah-0007OA-8g; Tue, 31 Aug 2021 13:14:15 +0000
Received: by outflank-mailman (input) for mailman id 175708;
 Tue, 31 Aug 2021 13:14:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mL3af-0007O4-FO
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 13:14:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54cf1ec2-0a5d-11ec-ad35-12813bfff9fa;
 Tue, 31 Aug 2021 13:14:12 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-HFaPn74_OjKTVBOWam4gHQ-1; Tue, 31 Aug 2021 15:14:09 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4786.eurprd04.prod.outlook.com (2603:10a6:208:cf::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Tue, 31 Aug
 2021 13:14:08 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 13:14:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.9 via Frontend Transport; Tue, 31 Aug 2021 13:14:08 +0000
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
X-Inumbo-ID: 54cf1ec2-0a5d-11ec-ad35-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630415651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLjecU7GYaAmb3YL7pJM2KztGqTG8vAzo2yXK0EOZjg=;
	b=TqY8WDELgzwTwmNic44LETTpGbWIYsCF9lZwBlWzlEX0QhT2oWFkrMcBO8us8CJWJTG4K0
	89KSUVJ5YsFN7xONTDtmmJbY4ZodvSWxnrEmJcUu8UFYAhUqQ1idgfPXgzXeZbYlNfRmE7
	GAWPJdXQYdanXIgelpsK41WIsoVkMlE=
X-MC-Unique: HFaPn74_OjKTVBOWam4gHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2ePx6cxZVxQSj1YxzSCZDEUTINh5yDh1WJ10oM4cC9PXKGnEcaO9RvZgXSxG1fs3WtqlxEWKAhEJIQDnNOAC9flp3h8R2U2FxK38uy9UPZijpMvVB2YzkVnO1khaWsWf4UEHLwqh1I169FLjpxME5qEN0NK2itOBiYYTBaXc1B/iVan+7EL6Pn5WJpEKmwVQa6in9iKPgAsGU5m+npX/9vF9nuG82EOehUi+PH3o9/SwTPQixxMEQqIhTZKNFNqtjWfjsHhEHWBk7jPLPBalfucv3t3M/7JjORl/BuBi++vPZ5oR5/Cdb/nqFmIvT1qy4YqhAhz9xlwMnxt1HkW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFF4fJKbHp6YIArCTDYlMsJMmLDJ5i1iQ7p6he4/FCI=;
 b=b105gyk1hgUds2kEKdgu3ThnSpEN8SU51CngqJDVOHGe169zYz2SB/bxXGmg9XvsdCw17y1H0/uhQVimp1tn8flzynaUs94q73vkDaFw2bJXfVdO7pwnZLStG8KYMPJSh/B5nkRoQ6gVH3G041AqxaR52QkVgRZEPjY/6ElSPd49Bd6y3LN/JKvCToEVNuueHXXdD94eumj52z+yhdz0+3UA0whlyLtCdjqSchz45uAy8XDKxjKUAFW+1dx90cIgcn/doHJOuoN2mr77yzECmOzLLCs15cRbKsWSh1uHxvmx5hJAyCsnATIP6+dKeneAbU1XChqBlf1SNgrDQyntVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/4] x86/PVH: de-duplicate mappings for first Mb of Dom0
 memory
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <013c49f5-7a14-9d9e-4d25-75934bf6349f@suse.com>
 <9cfc122f-dc4e-9dc0-0b57-48abf941025a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <866a3677-1f1a-e0e5-7ab0-10c210e25610@suse.com>
Date: Tue, 31 Aug 2021 15:14:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <9cfc122f-dc4e-9dc0-0b57-48abf941025a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a59fd604-4a61-4e3f-a7b8-08d96c813737
X-MS-TrafficTypeDiagnostic: AM0PR04MB4786:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB47869DD341ACAAB9A6DF3E5AB3CC9@AM0PR04MB4786.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hk1eX7c/5p35kmqPoaFn2jT2FFG8aG/LCgR/tVWpQeAXYVFa+2VlPK+D55w9veqtluGIr8b5Jw7Zg1ieya+QVD3hjoUeXao16mBx+agj72/NC/W4CJ1YgzQypq/QftOt7HjEEjz5KFAgq+a/VDoqSpt4r7uK+FE3aoeNZyhvzAoTqfKlyYsUEvEueHWWUnvx2q/TD0wfUeeq6p6KF/G/QGQ+OiovRt76JAgmoL3I96TvrnS92a02vzbH/1oP+PR4RvPyQl+16jggkdXq2sxfEUBu8uSmA58m43SCK9poGQS+fIyU+l9DoC7rmpuaKfH4f1//Qnjz9AAQjWRJO2clboAJmCQ2/WSeyAY09qRcEIUZykuk9E6G7HH8wxuPqaqOIMiAco4sDwUoX5+cHU5JGpwc0FzZZxK6jMc7p4Vanj1OvcJ3E4u5ulDCDA4htonbidDBrvY+eyibcXqlS5OHpozUl7m27fTXTf4+GbOKJCE8lVyOtnOtvm9GXJ08WnCjPHVIz4EgmkkRIO/yfKn7S8cElDRVXCNbnZmX2BWjjd2iPduG/MrIKjX7Hse4piHkQOH6OsucGpkB/+HtxaREJCNw2IxwSOrxcaAqDa/kObDhYZlpEA6bVsISTrRERKZDJKmgM9MjJ2B7pE+B8WbFtw9JjnVGsfzNWDjtq5ozv+ddUkjkXOt3nX7ILOBUqdA/wWlB0rWWnop8QP5TH0H4KDyIdt2wnkr4jlxWwlB7UNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(2906002)(6916009)(186003)(5660300002)(26005)(2616005)(53546011)(8676002)(36756003)(6486002)(86362001)(4326008)(83380400001)(31696002)(16576012)(316002)(66476007)(66556008)(31686004)(8936002)(956004)(508600001)(66946007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m1RHutMArytQZHvSi1Of2gMg+dL/4iLn8cPshC2YpWM7mZR2iPKEw+PKBPe1?=
 =?us-ascii?Q?bjtQ9QXsbJYm1hPLCtiE25bSxYBhngYJz8LUt5kH69LBNCB3fsaIyNw5wQt+?=
 =?us-ascii?Q?aWrgolA+UipJYgVa0rRdrdTeL+ULEuSpzf+pNcBRbrcRTZqafAI+8DKvc4MI?=
 =?us-ascii?Q?FnZYg3U97Wsx/rW8A2PmToOqoEhXZ4DhMfcH7hxfUAWe3RsdZ7f4FjKQQwRz?=
 =?us-ascii?Q?v8tS9jbFCRiEVgNCEk6JyuMfCGN1GXL+4HoBsHmT7IXK/yas8sBNTDaxDmby?=
 =?us-ascii?Q?pdWLOD4iDgqTVcKs053a7Tn6H0Sc0gpfypxhU0kGOM6e+ENYVT03bXzuhYhQ?=
 =?us-ascii?Q?obxEpAYgcjiJpopPCMYnkbI72ogO8pDvldthB4TxUnsCx/fgWaNkR7YW0AbD?=
 =?us-ascii?Q?faBmjo8X89yzRLjjM4rwVV8eo9QkAsIl9IT8KLUMNYX5d2UxS1m+B1IMfYn/?=
 =?us-ascii?Q?gYzWPbeMY5oqRmPBu36uwawF5fNYlkI5l4dY2eZmajybWbIgIKO1oSc7iZZe?=
 =?us-ascii?Q?/XjwqPtQ3HcDrqGUST2dlotY0kgFgL4E8tMPMF66JC/jhfc5/vvwN/XZ2xnJ?=
 =?us-ascii?Q?J1kwJv8wMPBcvzf+kGH01ybSY4FKr/jMNoaCphLX9k9lbqExaWzOAuR5z9e3?=
 =?us-ascii?Q?15CHV1iNBfsvJGP8E4ADS+I7rqpSF062Lv2obgijVAIYO/5PDc7cKedEkYWt?=
 =?us-ascii?Q?8e8bOxzwi1bLb+iAGgpD3Ulkexh9wfyjXpW5gWEJxT/tfUuyQvztx7oZbtuG?=
 =?us-ascii?Q?SNrY2L+B9zUGwQMii98FqjqoU0k9/kL4RtnVZiO3PhHBUo9M1s5AGE2UUWG2?=
 =?us-ascii?Q?BdpE+B71fYjOh1hx4HSxZl7duzf95fcUZ9nPpJrSvXR5L6q8wyjv31KxJhmr?=
 =?us-ascii?Q?1QiOLYbX/zU0pePG2je6KtuoQxl6Jt+4hCICti8Ebr4qCxi90yfrxSVKRlHD?=
 =?us-ascii?Q?0DQx/f3AlQmftSXu/dVd3D65U2Xrzo8rWWeObWQuutrbwKgmkWyCSXQobseA?=
 =?us-ascii?Q?whGkNqciLzENMOOGWzDKiex1RZyVOe7MRi6C25wMTleRhRyHHkYY2vVYyDVE?=
 =?us-ascii?Q?6bWa1P1fhKXxfi271ginexq4To5qEnqSBvB72uK7tX/WQxILQuR1vFdayt6N?=
 =?us-ascii?Q?NK3Ik0gCQyLW+A4Xp0pLB+yvSzN6CKcCpgWpScNUOOep5PCX5Gzw+fJ4KXxP?=
 =?us-ascii?Q?tf6Yo1m+x62KmwCU0pSnG9XMMSaNdlHvXKJm3VmUXifHvzcmTGs1BIGwIbs8?=
 =?us-ascii?Q?ISDtmQrjfIqlaGEhy1XlNSGkMMVQTW6dubIsu5T6Exxxpm0RC/wiyxVwvgBY?=
 =?us-ascii?Q?iiYlkJr6PnjuhqKXlduaW1hC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59fd604-4a61-4e3f-a7b8-08d96c813737
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 13:14:08.3770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCYeZ10HPS1lkNPzDpQdwwnCCfhBTFKYEviLrf19P4T0JoalcemRYNhJPavzC7tTqA0Nn7fqIJgLNMpLieqC6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4786

On 31.08.2021 15:02, Andrew Cooper wrote:
> On 30/08/2021 14:02, Jan Beulich wrote:
>> One of the changes comprising the fixes for XSA-378 disallows replacing
>> MMIO mappings by unintended (for this purpose) code paths.
>=20
> I'd drop the brackets.=C2=A0 All it does is confuse the sentence.
>=20
>>  This means we
>> need to be more careful about the mappings put in place in this range -
>> mappings should be created exactly once:
>> - iommu_hwdom_init() comes first; it should avoid the first Mb,
>> - pvh_populate_p2m() should insert identity mappings only into ranges
>>   not populated as RAM,
>> - pvh_setup_acpi() should again avoid the first Mb, which was already
>>   dealt with at that point.
>=20
> This really is a mess.=C2=A0 It also seems very fragile.

So it seems to me.

> Why is iommu_hwdom_init() separate in the first place?=C2=A0 It only does
> mappings up to 4G in the first place, and with this change, it is now
> [1M-4G)

I guess we'll want to wait for Roger to return to shed some light on
this.

>> @@ -1095,6 +1101,17 @@ static int __init pvh_setup_acpi(struct
>>          nr_pages =3D PFN_UP((d->arch.e820[i].addr & ~PAGE_MASK) +
>>                            d->arch.e820[i].size);
>> =20
>> +        /* Memory below 1MB has been dealt with by pvh_populate_p2m(). =
*/
>> +        if ( pfn < PFN_DOWN(MB(1)) )
>> +        {
>> +            if ( pfn + nr_pages <=3D PFN_DOWN(MB(1)) )
>> +                continue;
>> +
>> +            /* This shouldn't happen, but is easy to deal with. */
>=20
> I'm not sure this comment is helpful.
>=20
> Under PVH, there is nothing special about the 1M boundary, and we can
> reasonably have something else here or crossing the boundary.

As long as we have this special treatment of the low Mb, the boundary
is meaningful imo. I'd see the comment go away when the handling in
general gets streamlined.

> Preferably with this removed, Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>, but only because this is an emergency fix.

Thanks. I see. You'll like patch 2 even less; at least I do. And I'm
not really certain that change is enough to cover all possible
systems.

> I really don't think it is an improvement to the logic.

Yet I suppose you also have no immediate suggestions towards doing
better? Of course right here a full rework is out of scope. But if
there were smaller bits that - if adjusted - would make you feel
better about the change as a whole, I'd be happy to consider making
adjustments.

Jan


