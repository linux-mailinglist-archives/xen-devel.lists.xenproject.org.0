Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AD73CB9A2
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 17:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157594.290245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4PeQ-0004NS-7a; Fri, 16 Jul 2021 15:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157594.290245; Fri, 16 Jul 2021 15:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4PeQ-0004LR-4D; Fri, 16 Jul 2021 15:21:18 +0000
Received: by outflank-mailman (input) for mailman id 157594;
 Fri, 16 Jul 2021 15:21:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aN3H=MI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m4PeP-0004LL-De
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 15:21:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 159c2f27-24ac-46a2-97f6-840803ea59ee;
 Fri, 16 Jul 2021 15:21:15 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-qEVwM3L2MHW9eTZlutirXA-2; Fri, 16 Jul 2021 17:21:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 15:21:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Fri, 16 Jul 2021
 15:21:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:208:be::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 15:21:10 +0000
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
X-Inumbo-ID: 159c2f27-24ac-46a2-97f6-840803ea59ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626448874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uRiXdToTcOL1sfRrWt+ZEpu/Vt0QV6AltVwhNAqlnCQ=;
	b=dzH66s/uB1SE/D4ymcvPhimXGRbpknjbjkIoAoxKMe9izfZhp7efNm51K5Nm4f5hDJzaEw
	7VVeg893YID4Cda/13QqnwZ6MrzJCWQGDbpJL0CPuQgsB0Q+X9h0xkkNHwx8wR2vQXlAsn
	VTdcpCd8QBZ2M/iUyypDoFKFVF1s+FY=
X-MC-Unique: qEVwM3L2MHW9eTZlutirXA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9Rd0UjWWMoU/DUWDS1PCSV340ni6Iy+He+izAwmkLFVvv0xsstMSZBIk62FOMi5JXviop9bLtQTRfAPT38IqZMdwE8lJOnjN2+sZtE4qlJc2ad/8QW3kcIe9f7Y3C9MNS0EoiOLM+lW75XkfWdkSjV7nl3nI50sKlFfDDo029kvOcS0mL0rQBCrtp0dWzP7cLhHtonMUfaU2dt8aACOOmgWRtXMbrDGooBPAcbhkPnbPhBW3YSkccZTLwTuvwBZhIRVI24gqjkS5tRYYsbr/3SxbLI0D7vzj0ECRnGyVFJRMMW2Qqsh+VCnuGWpBQpwTPf6RB2sdCDOF6HkKy2Hlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRiXdToTcOL1sfRrWt+ZEpu/Vt0QV6AltVwhNAqlnCQ=;
 b=Fko2NRhEkCgS1poDi1WOsMPFmEdccj7gfq5d8zuR81IvVu9wUreXEP/GRPK7sqtlyoNEZscfwfHP+2gMM3NdY7EzcaZ1pPABQEwJ9hOhZ+X5Q/Q8qj24jam+KDLQyjoaG5D2bk+nua7N0xhtSBLnzOhFOiOdKG+qnK1/Yfd4QIoX03COiPpaAVp+gYkAbpzmBu8tyJaTkqZd2+b1naGm1K0+ifWOG8y/zBzXnwppBGrwD5b506T68k2/H8tKjCdafrEmMCtLxloAKbw94CjvhBu415De4OYlqeoaT23RVzHkev3pxx2zX+UmMmpf+RN4UWRjldHt7v4EVXwaRqp8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Suggested changes to the admission policy of the vulnerability
 pre-disclosure list
To: "Charles-H. Schulz" <charles.schulz@vates.fr>
References: <87r1fzclw0.fsf@vates.fr>
 <6da30009-d817-f48e-11b4-ba9c92cde93d@suse.com> <87k0lqmmf8.fsf@vates.fr>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea129173-c1fa-76f3-4964-8491b6728ca0@suse.com>
Date: Fri, 16 Jul 2021 17:21:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <87k0lqmmf8.fsf@vates.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0082.eurprd04.prod.outlook.com
 (2603:10a6:208:be::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d538673a-dda2-4a1b-f33d-08d9486d5762
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6384A66CBE6054CFA4717763B3119@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AZ8gH4ZkNyfwo9L68H0tHwPK1fGQbv8V+GopXVxHAlOwF4vv0Ph/OPUZHByehS8tgesJwpH/EH2CkTW/ErUOsSuowMj8WtoVPjD9rfUYV1wOn9KeqUobxfUE5PIhaG5IiQaRsgkp56VP3x3sXqK5MmfBZKNjbttoBpx3C9HX2STzCBgxprgDOhpK2b8VByBQO5CL/eYTUK9y5cQxSjuly0Jo69JZQloDrDTRMUeXVXhRM0XqMstCxvfDq4oROjJZeWvmLS0nX2YFv5oFEDuteNQDemYY3orvZsvIPwn8D0yd0kM6HjKOV1lmKHdK+9bNAT7yhffvfh1luEQbGdUO9LDAZZv5a2rmLC1C8m6XV8pIe9+8eKJsn9T0MCn6KKtGarf/ruGHcAweLSlvM5g7mx6XBJYMSZ7GlrlejqrWTbzCMEj8gEKG5FZeHfJT+uGZiXzT5k5GSuKejZTzj/4bqFzsW+iNV3VSS6vyNkTNcHpHQa9r7adOYW51M0fbtfWp2aOE1finzKvTnYvYi6+I74fbiB0ZzVSFR48+Io6CUhDyzo8cja4WPLTt+SG/xxZAJoeeZv7N08K9UpnEQO8nOSKUaChc97iuf+jQT7Xku0xaoXNwJzlvBa8ky5OEAn5Dqw4idI4iZpmF+gKrwmV7Hts3mveBW4XiKK17Peek6hlVJTTGu9enWv//dkoUkVnstgy9OyTX8+ivRtPyzUb7zmcOFvY5qOQQG+poPj1zHJRruL+TdA1KVptDxf4roEV4YVSrRr7KdmfHhY2YMFsfzmXSd0BG7RGX7VriBRzSwvKkt9v/Lztbf1nxUs9S15er
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(8936002)(6916009)(4326008)(36756003)(2616005)(956004)(26005)(8676002)(31696002)(31686004)(966005)(186003)(38100700002)(508600001)(86362001)(6486002)(16576012)(2906002)(53546011)(316002)(66556008)(66946007)(83380400001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU0ySldhRzdzMXhYbXQyNTRxTG81aytXdkJKRlFBTmR6Mmc1VWlNMDdXd3F6?=
 =?utf-8?B?dVFKSnVGemVxM0pxTms1Y2xvK0g4K2hKQm16d210WVJsbmRKcWVBVEdadjVH?=
 =?utf-8?B?TS9VOVZKNXFBa09QUm44WndWczBkNzhSdVpNV203S0V6eVRTOGRGWk5MNysx?=
 =?utf-8?B?RXA2alhpMThCNHBGNHIvaS9QNldxdlROUG0rZjRxU2NVeEx0WWZZK0tKK0d2?=
 =?utf-8?B?VWFrZS91RFVoOGJxZEFFekI2eVZPN0xDb1lsN3lhRTh5SlUva3ZXOGN6bWcy?=
 =?utf-8?B?cGkvY2x1dUlCRXVtSERvTVA5Rk9ablF2RDNVK084L2I1aEJDbFFzVkpLYXRG?=
 =?utf-8?B?RlhSNzZQRkxWN3Vzd2FhY25HYUFZUXlxNEdoRXBDR2FBalRpUldPNDhqQU95?=
 =?utf-8?B?aCtLUGhjNVdJL0o1M1VBNTVIRGIxSXdJeEhyMkV4M3lvWUJvUXJ3N2xSY3dL?=
 =?utf-8?B?WXBRRjVMYmZ6YTdJejY0TlVsdVBFcWhZcHZyeEZGOHdGdlROQXh6YlhaRkdI?=
 =?utf-8?B?dHo5SW4zbEd6a0hRL2tveDQ1bGVWdG12dTRsOG1FdVppYjlaODNhdk1ueHdt?=
 =?utf-8?B?aW9oa2xiV2FiR2tPSk8xY1dPbmdtMkUrZVNMMFBEdGJoYnJia3l4T292amtL?=
 =?utf-8?B?UmpKWVF3M1hid2N4WWE5eUxNSDdVSFV5UTQzVDM2UVg3aUswZUJjUzYxcDcz?=
 =?utf-8?B?QUtjaGdnMFdGbEdVTm0xalZwNHR0ZFZFVmFKZFJ1c3lQR1llSmV1d1kzVlVS?=
 =?utf-8?B?K3MwcytpSG9HSUxpUmFNamt5T1k4MXE4cEJCblF2M3krZ2haeWYrL1dBTDEz?=
 =?utf-8?B?dDU2SkVUbjVlZkcra3N6OGs1dU5VTjg2SGJqWXd5TWJuYnhDM3d6Uk8yNlVR?=
 =?utf-8?B?RzluSjUyeUQ5VE41OUdieG9VY2MxU1hjSFVUMDZBZEI2S1haUE5ta2UyeU5t?=
 =?utf-8?B?K3hLS2ZpdFRHcjhqb1BZckR2dHRzR2JUblhmcmFxK1BNZ3R2ODhuVER5WkF0?=
 =?utf-8?B?VmF1V0t2SjllblQ5eHV6UkZCZGZQLzRoWjNYYXFJTmRzY3I4NC81Y0V6SFl5?=
 =?utf-8?B?bGJOS093N01YeGxsTldaMTF2eGN5a0NtVXB0MEc0b3FTL081Z2t6ZkxhY1po?=
 =?utf-8?B?Q1VEVm1iSC92Y2JIeGtLbG11ajdLTk1pa0MwUTBmQjBUdm9ZWVpVbklTOWlB?=
 =?utf-8?B?OWdKK2syWlZtWjN1MzVRZHlMT0IrdnBqalo3cVh1MGVLSDhlQ0VLMnZGNnJM?=
 =?utf-8?B?eHdkeTY5Z1dGM0xha1RjMlpGQUFFTDFnbW1YSG9lcjhPcDZTN3prdXluRGha?=
 =?utf-8?B?MVRMQm1vVU1aZnJ1UmVXZ2c4dGJRRmdFMHBSa3lsbFR5Q2g3T0FTWjF0UFpw?=
 =?utf-8?B?MUFYSjFmZm1jMm5Xd2ZDODhuVUJnTkZsNWlFS2FKM0k5VjRzSHZhTHhHa0tY?=
 =?utf-8?B?SVc5TG5PN3hDTmtKN0VKZ3BySWxMTnFxc0drcHh6b2FIMm90WlJzdVpVcnJm?=
 =?utf-8?B?aE5OWjZzZG12R0x1RmxZYXYzOGh2K0ovTXR4MllFYVRzQnp6d05xcUR5Nndh?=
 =?utf-8?B?VzJIMGtoWlZpbS9lak5PZHVTcWN4ZElRUjhraGdVS1JZcURKcHVOTVNzNkVH?=
 =?utf-8?B?U3I3ak96bG1mT1ZQclJyWW1ET0pEbWpnMlBjM0JmZ0FGazJ5TWpGTXFhb2Q3?=
 =?utf-8?B?ZzhRWThSZ0xUNHFIaGs2MDJTU01UbWhoSlVEVkFHSTFLU2lJZTMrdUtydjhP?=
 =?utf-8?Q?NDD4H1SI33fnrQp09b+0KCl3+uq+d2yxH/rbnrT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d538673a-dda2-4a1b-f33d-08d9486d5762
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 15:21:10.6112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgiA2+8Dkd3sbN2D53NFs35U99l4hI4SmX1jKyCvdCiTMEVdhWEN/wJ5NknDZkHpIznAdUXlBMj5X9RDprTw3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

On 16.07.2021 15:13, Charles-H. Schulz wrote:
> Jan Beulich @ 2021-07-16 09:52 CEST:
>> On 15.07.2021 23:23, Charles-H. Schulz wrote:
>>> Hello,
>>>
>>> I /we /Vates would like to suggest some changes to the policy regarding the
>>> enrollment to the pre-disclosure mailing list of the Xen Security Team.
>>>
>>> We have had some talks with the French national CERT who has a need to be the
>>> recipient of such a list. This national CERT -and in my experience other
>>> national CERTs such as the NIST for instance- is in constant contact with a
>>> large Xen userbase that is mostly made up of large parts of the public sector
>>> as well as critical infrastructure operators belonging to the private
>>> sector. For confidentiality reasons they cannot disclose who uses Xen and
>>> where it is used nor who may be using it internally or within the related
>>> national cybersecurity authority.
>>>
>>> Because of that, their request may not be clear or matching the existing
>>> criteria for inclusion in the mailing list. National CERTs are trusted
>>> actors and have historically been among the very first entities to define,
>>> advocate for and put in practice the very notion of responsible
>>> disclosure. Much of the current practice of Open Source projects in that
>>> regard actually stems from CERTs. As part of their policies and processes
>>> regarding vulnerability disclosure, the notion of confidentiality and
>>> documented, waterfall-like processes of disclosure is play an integral
>>> part of
>>> how they handle informaton and publicity around vulnerability. As a result,
>>> national CERTs (and the French National CERT) do not spread undisclosed
>>> vulnerability without following established and agreed-upon processes. Such
>>> processes include, in our instance, the ones defined and followed by the Xen
>>> Security Team. Compliance with these are the first criteria to earn trust and
>>> respect from the ecosystem and the downstream users. You can see an example
>>> of their work here: https://www.cert.ssi.gouv.fr/
>>>
>>> Part of the mission of the French National CERT is to work with
>>> critical infrastructure providers in securing their IT.
>>> This kind of expertise entails the securing of these information
>>> systems before any unforeseen incident as well as after the incident
>>> (incident remediation).
>>> None of the tasks involved imply the communication of zero-day types
>>> of vulnerabilities or vulnerabilities that are unpublished to the
>>> downstream users.
>>
>> Would you mind shedding some light on the benefits of a national CERT
>> being in the know of unpublished vulnerabilities when they can't share
>> that knowledge with their downstreams, and hence their downstreams -
>> as long as they aren't themselves members of our predisclosure list -
>> would still be zero-dayed at the time of publication of such
>> vulnerabilities? Shouldn't their advice to their downstreams rather be
>> to direct them towards applying for pre-disclosure list membership?
> 
> In practice, most of the downstream users that the CERTs work with are not
> going to subscribe to the Xen pre-disclosure list, nor to any pre-disclosure
> lists of vendors or Open Source Software projects. The downstream users will
> work with CERTs and various cybersecurity service providers (Security
> Operations Centers -SOCs- being a typical example) in order for vulnerability
> discovery, disclosure, patching and later integration of fixes or remediatory
> measures be managed and applied.

It feels to me as if you didn't really answer my question. You restate
what I understood is the current state of things, from your initial mail.
The important aspect "when they can't share that knowledge with their
downstreams" doesn't get discussed at all. All their downstreams would
have to wait not only until public disclosure (instead of patching their
systems - as far as permitted in every individual case - already during
the embargo period), but there'll be an unavoidable further delay,
however small or large. I'm having difficulty seeing how this can be in
everybody's best interest, and hence I can't help suspecting that
information might flow irrespective of this being prohibited except
_among_ members of the predisclosure list.

What I could see is them acting as a proxy for their downstreams, but
this isn't what you've been asking for, and this would also mean much
more of a change to the policy.

> So a national CERT being in the loop of such advanced, upstream vulnerability
> pre-disclosures list is pretty much what a CERT does when it's not publishing
> security advisories of some kind. There are several benefits for a CERT:
> - threat intelligence and analysis: one vulnerability discovered in one
>   source may not be an isolated "incident" - it may be connected to a broader
>   attack made of the exploitation of several vulnerabilities found across
>   different software stacks. This also providers valuable information about the
>   threat landscape and relevance. For instance, Xen having several
>   vulnerability reports is one thing, but what happens if KVM receives a batch
>   of previously unknown vulnerabilities roughly at the same time? For a CERT,
>   that level of information can be very important (sometimes "national
>   security" important)
> 
> - because of a CERT being a nexus of several threat information/intelligence
>   by being as upstream as it can on critical software components, it can then
>   act -not by disclosing or patching yet unpublished vulnerabilities on its
>   own- by setting the effective patching and remediation work on the
>   information systems it is in charge of protecting. In the case of a
>   national CERT, such as the CERT-FR, that would be the French central
>   administration networks and information systems. Essentially it would
>   prioritize the response given the specific level and nature  of threats and the
>   presence of vulnerabilities on the systems (i.e: first patch MS Office,
>   then Apache httpd, then the vulnerability XYZ00123 on Xen as it really
>   affects only a small part of our Xen deployments).
> 
> - last but not least, CERTs act as central vulnerability reports
>   "broadcasters". CERT users/subscribers/clients point to CERTs to receive
>   their daily security watch and alerts. 
> 
>>
>> As to the actual policy - how would you propose to categorize such
>> organizations, i.e. how would a new bullet point in the present
>>
>> "
>> This includes:
>>
>>     Public hosting providers;
>>     Large-scale organisational users of Xen;
>>     Vendors of Xen-based systems;
>>     Distributors of operating systems with Xen support.
>> "
>>
>> look like in your opinion? This is pretty important imo, as it will
>> need to be understood who else might then become eligible.
> 
> I think it's either a very difficult or a very simple question. If I were to
> suggest to simply add a line with "national CERTs" meaning: CERTs that
> operate on behalf of governments for the protection and cybersecurity watch
> of national administration and critical infrastructures" would that be
> accepted? I'm happy with that one. It's really two criteria I'm adding: being
> a CERTs acting wth a clear mandate from a national authority to serve as the
> national computing emergency response team. Not sure how satisfactory that
> is.

So what if some entity acted largely like a "national CERT", but wasn't
called that way? The present items on the list try to use pretty generic
terms, while your suggestion is pretty specific. I'm further afraid that
"a clear mandate from a national authority" may not provide any
justification at all, depending on (often political) view points.

Jan


