Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FE7F64EF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 18:10:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639955.997662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6DDQ-0008Cp-CP; Thu, 23 Nov 2023 17:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639955.997662; Thu, 23 Nov 2023 17:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6DDQ-0008Ac-8e; Thu, 23 Nov 2023 17:10:12 +0000
Received: by outflank-mailman (input) for mailman id 639955;
 Thu, 23 Nov 2023 17:10:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xmv=HE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6DDO-0008AU-CA
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 17:10:10 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 264f0079-8a23-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 18:10:06 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c87903d314so14056721fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 09:10:06 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n7-20020adff087000000b003316d1a3b05sm2104531wro.78.2023.11.23.09.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 09:10:05 -0800 (PST)
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
X-Inumbo-ID: 264f0079-8a23-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700759406; x=1701364206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4c8k81uClM/uqFpAmLEk8/hlWeBjVXEzuSST+wv78Hw=;
        b=Mpet6DS6jPv9sqOdHB+1KCUg+dmjKKbMmXZHDpN4Wpligs0VWFmOcPgdCwmv7I/whV
         XMd7isBGTAjXigxhqy1su79FWivHSjewrujEnF+gtJtKFUcOYxq5UMB8Vjv4mgcLvjzC
         kbG9i8Jp+EKG4YVstw4LzIqW6/RaX6/X4iE0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700759406; x=1701364206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4c8k81uClM/uqFpAmLEk8/hlWeBjVXEzuSST+wv78Hw=;
        b=ADY1b7iFI+t3FawIt1rV6/0sMwc3sAg2pQ6sP+XGaVpx1kpLfipsRcTpMsmPbXp/ua
         auPshgA3+aq6YyBzfL3hDoxYTmaOqmL/X8rubHK8LCbGqV+0+1Y5lf7TsHGf5wW+iyuc
         oo91REcT7Eu/IB9ol4v1Tgg/fdcxqzX9FDg7WnPNgbc3AzxBdMuTzE4VvrgAht9w2fVC
         9Lu2T2hBWbejTslYhVqOhYvdwYiqoA+UiDMAY1jhFHXgHzCci/lCyghGsNyIaORF9Hbf
         dHsWE3N6rs4s6X5+fversHkulfKwDWXyX2WSDzGRiJJ6gsNdgxwr2dSuBVbB8hJZhN+T
         by4g==
X-Gm-Message-State: AOJu0YxKoPBniN+QhVxOffibDy7DkXSMWGhm9WojVGq42Lmg0H2oLt9w
	jJCgaOJSgCydSBapfuOl1UHh3Q==
X-Google-Smtp-Source: AGHT+IH0MsO9ZgK0P8czNGXhaxhnOScXZC6X06ToS60kcqQfkra9ivgCq13t/fD4ZoTR+tvwMLUcqw==
X-Received: by 2002:a2e:9d09:0:b0:2bc:c650:81b with SMTP id t9-20020a2e9d09000000b002bcc650081bmr539lji.15.1700759406242;
        Thu, 23 Nov 2023 09:10:06 -0800 (PST)
Message-ID: <958b6113-2fba-4699-ae19-d3852d44b155@cloud.com>
Date: Thu, 23 Nov 2023 17:10:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] tools/pygrub: Expose libfsimage's fdopen() to python
Content-Language: en-US
To: Andrew Cooper <andcooper@tibco.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
 <20231106150508.22665-6-alejandro.vallejo@cloud.com>
 <48d6adeb-eb2d-40ac-949b-b6676dcab4f9@tibco.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <48d6adeb-eb2d-40ac-949b-b6676dcab4f9@tibco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2023 22:35, Andrew Cooper wrote:
> On 06/11/2023 3:05 pm, Alejandro Vallejo wrote:
>> Create a wrapper for the new fdopen() function of libfsimage.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> I'd appreciate it if Marek would cast his eye (as python maintainer)
> over it.
> 
> That said, ...
> 
>> diff --git a/tools/pygrub/src/fsimage/fsimage.c b/tools/pygrub/src/fsimage/fsimage.c
>> index 12dfcff6e3..216f265331 100644
>> --- a/tools/pygrub/src/fsimage/fsimage.c
>> +++ b/tools/pygrub/src/fsimage/fsimage.c
>> @@ -270,6 +270,30 @@ fsimage_open(PyObject *o, PyObject *args, PyObject *kwargs)
>>   	return (PyObject *)fs;
>>   }
>>   
>> +static PyObject *
>> +fsimage_fdopen(PyObject *o, PyObject *args, PyObject *kwargs)
>> +{
>> +	static char *kwlist[] = { "fd", "offset", "options", NULL };
>> +	int fd;
>> +	char *options = NULL;
>> +	uint64_t offset = 0;
>> +	fsimage_fs_t *fs;
>> +
>> +	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "i|Ls", kwlist,
>> +	    &fd, &offset, &options))
>> +		return (NULL);
>> +
>> +	if ((fs = PyObject_NEW(fsimage_fs_t, &fsimage_fs_type)) == NULL)
>> +		return (NULL);
>> +
>> +	if ((fs->fs = fsi_fdopen_fsimage(fd, offset, options)) == NULL) {
>> +		PyErr_SetFromErrno(PyExc_IOError);
> 
> Don't we need a Py_DECREF(fs) here to avoid leaking it?
> 
> ~Andrew
If so, there's a bug in fsimage_open() as well. The logic here identical
to the logic there.

Cheers,
Alejandro

