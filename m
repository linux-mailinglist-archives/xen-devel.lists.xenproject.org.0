Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7982A231
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 21:24:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665730.1036014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNf6o-0006XN-2x; Wed, 10 Jan 2024 20:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665730.1036014; Wed, 10 Jan 2024 20:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNf6n-0006Vo-VY; Wed, 10 Jan 2024 20:23:29 +0000
Received: by outflank-mailman (input) for mailman id 665730;
 Wed, 10 Jan 2024 20:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWwH=IU=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNf6m-0006Vi-O4
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 20:23:28 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cf27c94-aff6-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 21:23:27 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55818b733f7so2491547a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 12:23:27 -0800 (PST)
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
X-Inumbo-ID: 1cf27c94-aff6-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704918207; x=1705523007; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBGf0IuUG38vXQsIxftO89nhi+1jrWBQtlWj2Lc3lnk=;
        b=mZzGyFNU1Ovei4Wol0ZLyaVXfCdWUb+Ga9LSZ+zaWLjtVvqytVha6II/Rw6Y+YCyYx
         zYwVSk0ofXK7bRkru2tAkP0pwoj5ctnUNT/rPxo6J9dXwXRJlAfvUZLC5bRuC+WUmEkJ
         V9YZhWTj7N8gkMb3LMXBPTkEEToul+gTcDVGO+HRC+KL9RKVzGtT0nAo5vh/vgcHsJZC
         /gIfSRu72cQVk+tRzSMFsvyC1HIp27JfELSifFQEWl2dV3vtU/ckGNWNdF/PJpqdnfPi
         0NJiL/2v3Qbd8u4t/dEa+ErVEQj3snv1kfx0kjbzxdaUT73XAKKE1ga/8aunCbB1TwbX
         AvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704918207; x=1705523007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBGf0IuUG38vXQsIxftO89nhi+1jrWBQtlWj2Lc3lnk=;
        b=FAT+gZxjB/0uNVWfIjP8QEoMpPbPT5Z3W86MyYMzc4dW/GkJM3SshjByEoa6JLQ5h6
         cJQM70brGf96bBwr/nBYPyj04IFzTg6Xn1Pnb+A+ZifH/B5XgqJ2CdCGZPGMzkY8jezt
         p+/DqPc+0FW8ZKQJlUz5XkeDwZ2Asc793pBKRd1UohiOI5yZMM4t1LW31/dBigtE4rmY
         QaQOOPx4X5wgQXWNJ9DQhivWwKVlgtNmqLcsh3MVEvJ1ic9/bL3bi3VtgUHFExJwE9+s
         1hO7d3VvD3GL1j8hIikc7n1TAof2eS5zNY3F+vLRAxi2uDYawr+qjZxBKL1Zof9q6dfu
         IDSg==
X-Gm-Message-State: AOJu0YykyVt4Za39QvK86Qi89j665yAQHCU6l8TD5BtFplzI2XCpySgS
	/vkTM6xBusW418A1qWjAAAM2AL2v2JIWVMhuqaegXv/V
X-Google-Smtp-Source: AGHT+IG7wOGRVACRpE8ZELfVyCbggWXYA5dwJATs6llX4jTDlked/4YlJlgNiT5VHy8cavQ+zmsTWHyUjcbqhKEKlrc=
X-Received: by 2002:a05:6402:120a:b0:553:37e1:a5a with SMTP id
 c10-20020a056402120a00b0055337e10a5amr21280edw.40.1704918207176; Wed, 10 Jan
 2024 12:23:27 -0800 (PST)
MIME-Version: 1.0
References: <20240104090055.27323-1-jgross@suse.com> <20240104090055.27323-23-jgross@suse.com>
In-Reply-To: <20240104090055.27323-23-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 Jan 2024 15:23:14 -0500
Message-ID: <CAKf6xpu09_tMsAcX_fZfnbiLjpcE5k8cNeb-jTs6XTo5LvnRMA@mail.gmail.com>
Subject: Re: [PATCH v3 22/33] tools/xenstored: add early_init() function
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 4:12=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> Some xenstored initialization needs to be done in the daemon case only,
> so split it out into a new early_init() function being a stub in the
> stubdom case.
>
> Remove the call of talloc_enable_leak_report_full(), as it serves no
> real purpose: the daemon only ever exits due to a crash, in which case
> a log of talloc()ed memory hardly has any value.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

